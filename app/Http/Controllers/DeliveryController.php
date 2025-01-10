<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\Sale;
use App\Models\Product_Sale;
use App\Models\Product;
use App\Models\ProductVariant;
use App\Models\ProductBatch;
use App\Models\Delivery;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use DB;
use Auth;
use App\Mail\DeliveryDetails;
use App\Mail\DeliveryChallan;
use Mail;
use App\Models\MailSetting;
use Illuminate\Support\Facades\Cache;
use App\Models\Courier;

class DeliveryController extends Controller
{
    use \App\Traits\MailInfo;

    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('delivery')) {
            if(Auth::user()->role_id > 2 && config('staff_access') == 'own')
                $lims_delivery_all = Delivery::orderBy('id', 'desc')->where('user_id', Auth::id())->get();
            else
                $lims_delivery_all = Delivery::orderBy('id', 'desc')->get();
            $lims_courier_list = Courier::where('is_active', true)->get();
            return view('backend.delivery.index', compact('lims_delivery_all', 'lims_courier_list'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function deliveryListData(Request $request)
    {
        $role = Role::find(Auth::user()->role_id);

        $columns = array(
            1 => 'reference_no'
        );
        if($role->hasPermissionTo('delivery')) {
            if(Auth::user()->role_id > 2 && config('staff_access') == 'own')
                $lims_delivery_all = Delivery::orderBy('id', 'desc')->where('user_id', Auth::id())->get();
            else
                $lims_delivery_all = Delivery::orderBy('id', 'desc')->get();
            $lims_courier_list = Courier::where('is_active', true)->get();
        }

        if($request->input('length') != -1)
            $limit = $request->input('length');
        // $order = $columns[$request->input('order.0.column')];
        // $dir = $request->input('order.0.dir');

          $start = $request->input('start');
        // $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');

        if($request->input('search.value')) {
            $search = $request->input('search.value');
            $totalData = Delivery::where([
                ['reference_no', 'LIKE', "%{$search}%"]
            ])->count();
            // $lims_delivery_all = Delivery::where([
            //                         ['reference_no', 'LIKE', "%{$search}%"]
            //                     ])->get();
            $lims_delivery_all =  Delivery::select('deliveries.*')
                                            ->leftJoin('sales', 'deliveries.sale_id', '=', 'sales.id')
                                            ->leftJoin('packing_slips', 'deliveries.packing_slip_ids', '=', 'packing_slips.id') // Adjust if multiple ids
                                            ->leftJoin('customers', 'sales.customer_id', '=', 'customers.id') // Join the customers table via sales
                                            ->where(function($q) use ($search) {
                                                $q->where('deliveries.reference_no', 'LIKE', "%{$search}%")      // Search in deliveries reference_no
                                                ->orWhere('sales.reference_no', 'LIKE', "%{$search}%")         // Search in sales reference_no
                                                ->orWhere('packing_slips.reference_no', 'LIKE', "%{$search}%") // Search in packing_slips reference_no
                                                ->orWhere('deliveries.packing_slip_ids', 'LIKE', "%{$search}%")// Search in packing_slip_ids
                                                ->orWhere('customers.name', 'LIKE', "%{$search}%")             // Search in customer name
                                                ->orWhere('customers.phone_number', 'LIKE', "%{$search}%");    // Search in customer phone number
                                            })->get();
        }
        else {
            $totalData = Delivery::count();
            $lims_delivery_all = Delivery::get();
        }
        $totalFiltered = $totalData;
        $data = [];
        foreach ($lims_delivery_all as $key=>$delivery)
        {
            $customer_sale = DB::table('sales')
                            ->join('customers', 'sales.customer_id', '=', 'customers.id')
                            ->where('sales.id', $delivery->sale_id)
                            ->select('sales.reference_no','customers.name', 'customers.phone_number', 'customers.city', 'sales.grand_total')
                            ->get();

            $product_names = DB::table('sales')
                            ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
                            ->join('products', 'products.id', '=', 'product_sales.product_id')
                            ->where('sales.id', $delivery->sale_id)
                            ->pluck('products.name')
                            ->toArray();
            if($delivery->packing_slip_ids)
                $packing_slip_references = \App\Models\PackingSlip::whereIn('id', explode(",", $delivery->packing_slip_ids))->pluck('reference_no')->toArray();
            else
                $packing_slip_references[0] = 'N/A';

            if($delivery->status == 1)
                $status = trans('file.Packing');
            elseif($delivery->status == 2)
                $status = trans('file.Delivering');
            else
                $status = trans('file.Delivered');

            $barcode = \DNS2D::getBarcodePNG($delivery->reference_no, 'QRCODE');
            if($delivery->sale)
            {
                $nestedData['key'] = count($data);
                $nestedData['reference_no'] = $delivery->reference_no;
                $nestedData['sale_reference'] = $customer_sale[0]->reference_no;
                $nestedData['packing_slip_references'] = implode(",", $packing_slip_references);
                $nestedData['customer'] = $customer_sale[0]->name .'<br>'.$customer_sale[0]->phone_number;
                $nestedData['courier'] = $delivery->courier_id ? $delivery->courier->name : 'N/A';
                $nestedData['address'] = $delivery->address;
                $nestedData['products'] = implode(",", $product_names);
                $nestedData['grand_total'] = number_format($customer_sale[0]->grand_total, 2);
                if($delivery->status == 1)
                    $nestedData['status'] = '<div class="badge badge-primary">'.trans('file.Packing').'</div>';
                elseif($delivery->status == 2)
                    $nestedData['status'] = '<div class="badge badge-primary">'.trans('file.Delivering').'</div>';
                else
                    $nestedData['status'] = '<div class="badge badge-primary">'.trans('file.Delivered').'</div>';
                $nestedData['options'] = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.trans("file.action").'
                              <span class="caret"></span>
                              <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" data-id="'.$delivery->id.'" class="open-EditCategoryDialog btn btn-link" data-toggle="modal" data-target="#editModal" ><i class="dripicons-document-edit"></i> '.trans("file.edit").'</button>
                                </li>
                                <li class="divider"></li>'.
                                \Form::open(["route" => ["delivery.delete", $delivery->id], "method" => "POST"] ).'
                                <li>
                                  <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> '.trans("file.delete").'</button>
                                </li>'.\Form::close().'
                            </ul>
                        </div>';
            }
            $data[] = $nestedData;
        }
        $json_data = array(
            "draw"            => intval($request->input('draw')),
            "recordsTotal"    => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data"            => $data
        );

        echo json_encode($json_data);
    }

    public function create($id){
        $lims_delivery_data = Delivery::where('sale_id', $id)->first();
        if($lims_delivery_data){
            $customer_sale = DB::table('sales')->join('customers', 'sales.customer_id', '=', 'customers.id')->where('sales.id', $id)->select('sales.reference_no','customers.name')->get();

            $delivery_data[] = $lims_delivery_data->reference_no;
            $delivery_data[] = $customer_sale[0]->reference_no;
            $delivery_data[] = $lims_delivery_data->status;
            $delivery_data[] = $lims_delivery_data->delivered_by;
            $delivery_data[] = $lims_delivery_data->recieved_by;
            $delivery_data[] = $customer_sale[0]->name;
            $delivery_data[] = $lims_delivery_data->address;
            $delivery_data[] = $lims_delivery_data->note;
            $delivery_data[] = $lims_delivery_data->courier_id;
        }
        else{
            $customer_sale = DB::table('sales')->join('customers', 'sales.customer_id', '=', 'customers.id')->where('sales.id', $id)->select('sales.reference_no','customers.name', 'customers.address', 'customers.city', 'customers.country')->get();

            $delivery_data[] = 'dr-' . date("Ymd") . '-'. date("his");
            $delivery_data[] = $customer_sale[0]->reference_no;
            $delivery_data[] = '';
            $delivery_data[] = '';
            $delivery_data[] = '';
            $delivery_data[] = $customer_sale[0]->name;
            $delivery_data[] = $customer_sale[0]->address.' '.$customer_sale[0]->city.' '.$customer_sale[0]->country;
            $delivery_data[] = '';
        }
        return $delivery_data;
    }

    public function store(Request $request)
    {
        $data = $request->except('file');
        $delivery = Delivery::firstOrNew(['reference_no' => $data['reference_no'] ]);
        $document = $request->file;
        if ($document) {
            $ext = pathinfo($document->getClientOriginalName(), PATHINFO_EXTENSION);
            $documentName = $data['reference_no'] . '.' . $ext;
            $document->move(public_path('documents/delivery'), $documentName);
            $delivery->file = $documentName;
        }
        $delivery->sale_id = $data['sale_id'];
        $delivery->user_id = Auth::id();
        $delivery->courier_id = $data['courier_id'];
        $delivery->address = $data['address'];
        $delivery->delivered_by = $data['delivered_by'];
        $delivery->recieved_by = $data['recieved_by'];
        $delivery->status = $data['status'];
        $delivery->note = $data['note'];
        $delivery->save();
        $lims_sale_data = Sale::find($data['sale_id']);
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        $message = 'Delivery created successfully';
        $mail_setting = MailSetting::latest()->first();
        if($lims_customer_data->email && $data['status'] != 1 && $mail_setting) {
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['customer'] = $lims_customer_data->name;
            $mail_data['sale_reference'] = $lims_sale_data->reference_no;
            $mail_data['delivery_reference'] = $delivery->reference_no;
            $mail_data['status'] = $data['status'];
            $mail_data['address'] = $data['address'];
            $mail_data['delivered_by'] = $data['delivered_by'];
            $this->setMailInfo($mail_setting);
            try{
                Mail::to($mail_data['email'])->send(new DeliveryDetails($mail_data));
            }
            catch(\Exception $e){
                $message = 'Delivery created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('delivery')->with('message', $message);
    }

    public function productDeliveryData($id)
    {
        $lims_delivery_data = Delivery::find($id);
        //return 'madarchod';
        $lims_product_sale_data = Product_Sale::where('sale_id', $lims_delivery_data->sale->id)->get();

        foreach ($lims_product_sale_data as $key => $product_sale_data) {
            $product = Product::select('name', 'code')->find($product_sale_data->product_id);
            if($product_sale_data->variant_id) {
                $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_sale_data->product_id, $product_sale_data->variant_id)->first();
                $product->code = $lims_product_variant_data->item_code;
            }
            if($product_sale_data->product_batch_id) {
                $product_batch_data = ProductBatch::select('batch_no', 'expired_date')->find($product_sale_data->product_batch_id);
                if($product_batch_data) {
                    $batch_no = $product_batch_data->batch_no;
                    $expired_date = date(config('date_format'), strtotime($product_batch_data->expired_date));
                }
            }
            else {
                $batch_no = 'N/A';
                $expired_date = 'N/A';
            }
            $product_sale[0][$key] = $product->code;
            $product_sale[1][$key] = $product->name;
            $product_sale[2][$key] = $batch_no;
            $product_sale[3][$key] = $expired_date;
            $product_sale[4][$key] = $product_sale_data->qty;
        }
        return $product_sale;
    }

    public function sendMail(Request $request)
    {
        $data = $request->all();
        $lims_delivery_data = Delivery::find($data['delivery_id']);
        $lims_sale_data = Sale::find($lims_delivery_data->sale->id);
        $lims_product_sale_data = Product_Sale::where('sale_id', $lims_delivery_data->sale->id)->get();
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        $mail_setting = MailSetting::latest()->first();
        if($lims_customer_data->email && $mail_setting) {
            //collecting male data
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['date'] = date(config('date_format'), strtotime($lims_delivery_data->created_at->toDateString()));
            $mail_data['delivery_reference_no'] = $lims_delivery_data->reference_no;
            $mail_data['sale_reference_no'] = $lims_sale_data->reference_no;
            $mail_data['status'] = $lims_delivery_data->status;
            $mail_data['customer_name'] = $lims_customer_data->name;
            $mail_data['address'] = $lims_customer_data->address . ', '.$lims_customer_data->city;
            $mail_data['phone_number'] = $lims_customer_data->phone_number;
            $mail_data['note'] = $lims_delivery_data->note;
            $mail_data['prepared_by'] = $lims_delivery_data->user->name;
            if($lims_delivery_data->delivered_by)
                $mail_data['delivered_by'] = $lims_delivery_data->delivered_by;
            else
                $mail_data['delivered_by'] = 'N/A';
            if($lims_delivery_data->recieved_by)
                $mail_data['recieved_by'] = $lims_delivery_data->recieved_by;
            else
                $mail_data['recieved_by'] = 'N/A';
            //return $mail_data;

            foreach ($lims_product_sale_data as $key => $product_sale_data) {
                $lims_product_data = Product::select('code', 'name')->find($product_sale_data->product_id);
                $mail_data['codes'][$key] = $lims_product_data->code;
                $mail_data['name'][$key] = $lims_product_data->name;
                if($product_sale_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_sale_data->product_id, $product_sale_data->variant_id)->first();
                    $mail_data['codes'][$key] = $lims_product_variant_data->item_code;
                }
                $mail_data['qty'][$key] = $product_sale_data->qty;
            }
            $this->setMailInfo($mail_setting);
            try{
                Mail::to($mail_data['email'])->send(new DeliveryChallan($mail_data));
                $message = 'Mail sent successfully';
            }
            catch(\Exception $e){
                $message = 'Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        else
            $message = 'Customer does not have email!';

        return redirect()->back()->with('message', $message);
    }

    public function edit($id)
    {
        $lims_delivery_data = Delivery::find($id);
        $customer_sale = DB::table('sales')->join('customers', 'sales.customer_id', '=', 'customers.id')->where('sales.id', $lims_delivery_data->sale_id)->select('sales.reference_no','customers.name')->get();

        $delivery_data[] = $lims_delivery_data->reference_no;
        $delivery_data[] = $customer_sale[0]->reference_no;
        $delivery_data[] = $lims_delivery_data->status;
        $delivery_data[] = $lims_delivery_data->delivered_by;
        $delivery_data[] = $lims_delivery_data->recieved_by;
        $delivery_data[] = $customer_sale[0]->name;
        $delivery_data[] = $lims_delivery_data->address;
        $delivery_data[] = $lims_delivery_data->note;
        $delivery_data[] = $lims_delivery_data->courier_id;
        return $delivery_data;
    }

    public function update(Request $request)
    {
        $input = $request->except('file');
        //return $input;
        $lims_delivery_data = Delivery::find($input['delivery_id']);
        $document = $request->file;
        if ($document) {
            $this->fileDelete(public_path('documents/delivery/'), $lims_delivery_data->file);
            $ext = pathinfo($document->getClientOriginalName(), PATHINFO_EXTENSION);
            $documentName = $input['reference_no'] . '.' . $ext;
            $document->move(public_path('documents/delivery'), $documentName);
            $input['file'] = $documentName;
        }
        $lims_delivery_data->update($input);
        $lims_sale_data = Sale::find($lims_delivery_data->sale_id);
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        $message = 'Delivery updated successfully';
        $mail_setting = MailSetting::latest()->first();
        if($lims_customer_data->email && $input['status'] != 1 && $mail_setting) {
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['customer'] = $lims_customer_data->name;
            $mail_data['sale_reference'] = $lims_sale_data->reference_no;
            $mail_data['delivery_reference'] = $lims_delivery_data->reference_no;
            $mail_data['status'] = $input['status'];
            $mail_data['address'] = $input['address'];
            $mail_data['delivered_by'] = $input['delivered_by'];
            $this->setMailInfo($mail_setting);
            try{
                Mail::to($mail_data['email'])->send(new DeliveryDetails($mail_data));
            }
            catch(\Exception $e){
                $message = 'Delivery updated successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('delivery')->with('message', $message);
    }

    public function deleteBySelection(Request $request)
    {
        $delivery_id = $request['deliveryIdArray'];
        foreach ($delivery_id as $id) {
            $lims_delivery_data = Delivery::find($id);
            $this->fileDelete(public_path('documents/delivery/'), $lims_delivery_data->file);
            $lims_delivery_data->delete();
        }
        return 'Delivery deleted successfully';
    }

    public function delete($id)
    {
        $lims_delivery_data = Delivery::find($id);
        $this->fileDelete(public_path('documents/delivery/'), $lims_delivery_data->file);
        $lims_delivery_data->delete();

        return redirect('delivery')->with('not_permitted', 'Delivery deleted successfully');
    }
}
