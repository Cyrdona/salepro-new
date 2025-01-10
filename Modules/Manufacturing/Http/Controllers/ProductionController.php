<?php

namespace Modules\Manufacturing\Http\Controllers;

use App\Models\GeneralSetting;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use App\Models\Warehouse;
use App\Models\Product;
use App\Models\ProductVariant;
use App\Models\Product_Warehouse;
use App\Models\Unit;
use Modules\Manufacturing\Entities\Production;
use Modules\Manufacturing\Entities\ProductProduction;
use App\Models\Tax;
use App\Models\Account;
use App\Models\PosSetting;
use Auth;
use App\Traits\StaffAccess;
use Illuminate\Support\Facades\Validator;

class ProductionController extends Controller
{
    use StaffAccess;

    public function index(Request $request)
    {
        if(in_array('manufacturing',explode(',',config('addons')))) {
            if($request->input('warehouse_id'))
                $warehouse_id = $request->input('warehouse_id');
            else
                $warehouse_id = 0;

            if($request->input('status'))
                $status = $request->input('status');
            else
                $status = 0;

            if($request->input('starting_date')) {
                $starting_date = $request->input('starting_date');
                $ending_date = $request->input('ending_date');
            }
            else {
                $starting_date = date("Y-m-d", strtotime(date('Y-m-d', strtotime('-1 year', strtotime(date('Y-m-d') )))));
                $ending_date = date("Y-m-d");
            }

            $lims_pos_setting_data = PosSetting::select('stripe_public_key')->latest()->first();
            $lims_warehouse_list = Warehouse::where('is_active', true)->get();
            $lims_account_list = Account::where('is_active', true)->get();
            return view('manufacturing::production.index', compact('status', 'lims_account_list', 'lims_warehouse_list', 'lims_pos_setting_data', 'warehouse_id', 'starting_date', 'ending_date'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function productionData(Request $request)
    {
        $columns = array(
            1 => 'created_at',
            2 => 'reference_no',
            5 => 'grand_total',
            6 => 'paid_amount',
        );

        $warehouse_id = $request->input('warehouse_id');
        $status = $request->input('status');

        $q = Production::whereDate('created_at', '>=' ,$request->input('starting_date'))->whereDate('created_at', '<=' ,$request->input('ending_date'));
        //check staff access
        $this->staffAccessCheck($q);
        if($warehouse_id)
            $q = $q->where('warehouse_id', $warehouse_id);
        if($status)
            $q = $q->where('status', $status);

        $totalData = $q->count();
        $totalFiltered = $totalData;

        if($request->input('length') != -1)
            $limit = $request->input('length');
        else
            $limit = $totalData;
        $start = $request->input('start');
        $order = 'productions.'.$columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');

        if(empty($request->input('search.value'))) {
            $q = Production::with('user', 'warehouse')
                ->whereDate('created_at', '>=' ,$request->input('starting_date'))
                ->whereDate('created_at', '<=' ,$request->input('ending_date'))
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir);
            //check staff access
            $this->staffAccessCheck($q);
            if($warehouse_id)
                $q = $q->where('warehouse_id', $warehouse_id);
            if($status)
                $q = $q->where('status', $status);

            $productions = $q->get();
        }
        else
        {
            $search = $request->input('search.value');
            $q = Production::join('product_productions', 'productions.id', '=', 'product_productions.production_id')
                ->whereDate('productions.created_at', '=' , date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                ->offset($start)
                ->limit($limit)
                ->orderBy($order,$dir);
            if(Auth::user()->role_id > 2 && config('staff_access') == 'own') {
                $q =  $q->with('warehouse', 'user')
                        ->where('productions.user_id', Auth::id())
                        ->orwhere([
                            ['productions.reference_no', 'LIKE', "%{$search}%"],
                            ['productions.user_id', Auth::id()]
                        ]);
            }
            elseif(Auth::user()->role_id > 2 && config('staff_access') == 'warehouse') {
                $q =  $q->with('warehouse', 'user')
                ->where('productions.user_id', Auth::id())
                ->orwhere([
                    ['productions.reference_no', 'LIKE', "%{$search}%"],
                    ['productions.warehouse_id', Auth::user()->warehouse_id]
                ]);
            }
            else {
                $q = $q->with('warehouse', 'user')
                    ->orwhere('productions.reference_no', 'LIKE', "%{$search}%");
            }
            $productions = $q->select('productions.*')->groupBy('productions.id')->get();
            $totalFiltered = $q->groupBy('productions.id')->count();
        }
        $data = array();
        if(!empty($productions))
        {
            foreach ($productions as $key=>$production)
            {
                //$nestedData['id'] = $production->id;
                $nestedData['key'] = $key;
                $nestedData['date'] = date(config('date_format'), strtotime($production->created_at->toDateString()));
                $nestedData['reference_no'] = $production->reference_no;
                if($production->status == 1){
                    $nestedData['status'] = '<div class="badge badge-success">'.trans('file.Completed').'</div>';
                    $status = trans('file.Recieved');
                }

                $nestedData['total_cost'] = number_format($production->total_cost, config('decimal'));
                $nestedData['total_tax'] = number_format($production->total_tax, config('decimal'));
                $nestedData['shipping_cost'] = number_format($production->shipping_cost, config('decimal'));
                $nestedData['grand_total'] = number_format($production->grand_total, config('decimal'));

                $nestedData['options'] = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.trans("file.action").'
                              <span class="caret"></span>
                              <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" class="btn btn-link view"><i class="fa fa-eye"></i> '.trans('file.View').'</button>
                                </li>';

                $nestedData['options'] .= \Form::open(["route" => ["productions.destroy", $production->id], "method" => "DELETE"] ).'
                        <li>
                            <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> '.trans("file.delete").'</button>
                        </li>'.\Form::close().'
                    </ul>
                </div>';

                // data for production details by one click
                $user = $production->user;
                $nestedData['production'] = array( '[ "'.date(config('date_format'), strtotime($production->created_at->toDateString())).'"', ' "'.$production->reference_no.'"', ' "'.$status.'"',  ' "'.$production->id.'"', ' "'.$production->warehouse->name.'"', ' "'.$production->total_tax.'"', ' "'.$production->total_cost.'"', ' "'.$production->shipping_cost.'"', ' "'.$production->grand_total.'"', ' "'.preg_replace('/\s+/S', " ", $production->note).'"', ' "'.$user->name.'"', ' "'.$user->email.'"', ' "'.$production->document.'"]'
                );
                $data[] = $nestedData;
            }
        }
        $json_data = array(
            "draw"            => intval($request->input('draw')),
            "recordsTotal"    => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data"            => $data
        );
        echo json_encode($json_data);
    }


    public function create()
    {
        if(Auth::user()->role_id > 2) {
            $lims_warehouse_list = Warehouse::where([
                ['is_active', true],
                ['id', Auth::user()->warehouse_id]
            ])->get();
        }
        else {
            $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        }
        $lims_product_list = Product::where([
            ['type', 'combo'],
            ['is_active', true]
        ])->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        return view('manufacturing::production.create', compact( 'lims_warehouse_list', 'lims_product_list', 'lims_tax_list'));
    }

    public function store(Request $request)
    {
        $data = $request->except('document');
        //return dd($data);
        $data['user_id'] = Auth::id();
        $data['reference_no'] = 'production-' . date("Ymd") . '-'. date("his");
        $document = $request->document;
        if ($document) {
            $v = Validator::make(
                [
                    'extension' => strtolower($request->document->getClientOriginalExtension()),
                ],
                [
                    'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
                ]
            );
            if ($v->fails())
                return redirect()->back()->withErrors($v->errors());

            $ext = pathinfo($document->getClientOriginalName(), PATHINFO_EXTENSION);
            $documentName = date("Ymdhis");
            if(!config('database.connections.saleprosaas_landlord')) {
                $documentName = $documentName . '.' . $ext;
                $document->move('public/documents/production', $documentName);
            }
            else {
                $documentName = $this->getTenantId() . '_' . $documentName . '.' . $ext;
                $document->move('public/documents/production', $documentName);
            }
            $data['document'] = $documentName;
        }
        if(isset($data['created_at']))
            $data['created_at'] = date("Y-m-d H:i:s", strtotime($data['created_at']));
        else
            $data['created_at'] = date("Y-m-d H:i:s");
        //return dd($data);
        $lims_production_data = Production::create($data);

        $product_id = $data['product_id'];
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $recieved = $data['recieved'];
        $purchase_unit = $data['purchase_unit'];
        $net_unit_cost = $data['net_unit_cost'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];
        $product_production = [];

        foreach ($product_id as $i => $id) {
            $lims_purchase_unit_data  = Unit::where('unit_name', $purchase_unit[$i])->first();

            if ($lims_purchase_unit_data->operator == '*') {
                $quantity = $recieved[$i] * $lims_purchase_unit_data->operation_value;
            } else {
                $quantity = $recieved[$i] / $lims_purchase_unit_data->operation_value;
            }
            $lims_product_data = Product::find($id);

            $child_product_list = explode(",", $lims_product_data->product_list);
            $child_variant_list = explode(",", $lims_product_data->variant_list);
            $child_qty_list = explode(",", $lims_product_data->qty_list);

            if ($lims_purchase_unit_data->operator == '*') {
                $reduced_qty = $qty[$i] * $lims_purchase_unit_data->operation_value;
            }
            else {
                $reduced_qty = $qty[$i] / $lims_purchase_unit_data->operation_value;
            }

            //ducting quantity from child products
            $child_product_list = explode(",", $lims_product_data->product_list);
            if($lims_product_data->variant_list)
                $child_variant_list = explode(",", $lims_product_data->variant_list);
            else
                $child_variant_list = [];
            $child_qty_list = explode(",", $lims_product_data->qty_list);

            foreach ($child_product_list as $index => $child_id) {
                $child_data = Product::find($child_id);
                if(count($child_variant_list) && $child_variant_list[$index]) {
                    $child_product_variant_data = ProductVariant::where([
                        ['product_id', $child_id],
                        ['variant_id', $child_variant_list[$index]]
                    ])->first();

                    $child_warehouse_data = Product_Warehouse::where([
                        ['product_id', $child_id],
                        ['variant_id', $child_variant_list[$index]],
                        ['warehouse_id', $lims_production_data->warehouse_id ],
                    ])->first();

                    $child_product_variant_data->qty -= $reduced_qty * $child_qty_list[$index];
                    $child_product_variant_data->save();
                }
                else {
                    $child_warehouse_data = Product_Warehouse::where([
                        ['product_id', $child_id],
                        ['warehouse_id', $lims_production_data->warehouse_id ],
                    ])->first();
                }

                $child_data->qty -= $reduced_qty * $child_qty_list[$index];
                $child_warehouse_data->qty -= $reduced_qty * $child_qty_list[$index];

                $child_data->save();
                $child_warehouse_data->save();
            }

            $lims_product_warehouse_data = Product_Warehouse::where([
                ['product_id', $id],
                ['warehouse_id', $data['warehouse_id'] ],
            ])->first();

            //add quantity to product table
            $lims_product_data->qty = $lims_product_data->qty + $quantity;
            $lims_product_data->save();
            //add quantity to warehouse
            if ($lims_product_warehouse_data) {
                $lims_product_warehouse_data->qty = $lims_product_warehouse_data->qty + $quantity;
            }
            else {
                $lims_product_warehouse_data = new Product_Warehouse();
                $lims_product_warehouse_data->product_id = $id;
                $lims_product_warehouse_data->warehouse_id = $data['warehouse_id'];
                $lims_product_warehouse_data->qty = $quantity;
            }
            $lims_product_warehouse_data->save();

            $product_production['production_id'] = $lims_production_data->id ;
            $product_production['product_id'] = $id;
            $product_production['qty'] = $qty[$i];
            $product_production['recieved'] = $recieved[$i];
            $product_production['purchase_unit_id'] = $lims_purchase_unit_data->id;
            $product_production['net_unit_cost'] = $net_unit_cost[$i];
            $product_production['tax_rate'] = $tax_rate[$i];
            $product_production['tax'] = $tax[$i];
            $product_production['total'] = $total[$i];
            ProductProduction::create($product_production);
        }
        return redirect('productions')->with('message', 'Production created successfully');
    }

    public function productProductionData($id)
    {
        try {
            $lims_product_production_data = ProductProduction::where('production_id', $id)->get();
            $product_production = [];
            foreach ($lims_product_production_data as $key => $product_production_data) {
                $product = Product::find($product_production_data->product_id);
                $unit = Unit::find($product_production_data->purchase_unit_id);
                $product_production[0][$key] = $product->name . ' [' . $product->code.']';
                $product_production[1][$key] = $product_production_data->qty;
                $product_production[2][$key] = $product_production_data->recieved;
                $product_production[3][$key] = $unit->unit_code;
                $product_production[4][$key] = $product_production_data->tax;
                $product_production[5][$key] = $product_production_data->tax_rate;
                $product_production[6][$key] = $product_production_data->total;
            }
            return $product_production;
        }
        catch (Exception $e) {
            return 'Something is wrong!';
        }

    }

    public function show($id)
    {
        return view('manufacturing::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        return view('manufacturing::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        $lims_production_data = Production::find($id);
        $lims_product_production_data = ProductProduction::where('production_id', $id)->get();
        foreach ($lims_product_production_data as $product_production_data) {
            $lims_production_unit_data = Unit::find($product_production_data->purchase_unit_id);
            if ($lims_production_unit_data->operator == '*') {
                $recieved_qty = $product_production_data->recieved * $lims_production_unit_data->operation_value;
                $reduced_qty = $product_production_data->qty * $lims_production_unit_data->operation_value;

            }
            else {
                $recieved_qty = $product_production_data->recieved / $lims_production_unit_data->operation_value;
                $reduced_qty = $product_production_data->qty / $lims_production_unit_data->operation_value;
            }

            $lims_product_data = Product::find($product_production_data->product_id);
            $lims_product_warehouse_data = Product_Warehouse::FindProductWithoutVariant($product_production_data->product_id, $lims_production_data->warehouse_id)
                    ->first();

            $child_product_list = explode(",", $lims_product_data->product_list);
            $child_variant_list = explode(",", $lims_product_data->variant_list);
            $child_qty_list = explode(",", $lims_product_data->qty_list);

            //ducting quantity from child products
            $child_product_list = explode(",", $lims_product_data->product_list);
            if($lims_product_data->variant_list)
                $child_variant_list = explode(",", $lims_product_data->variant_list);
            else
                $child_variant_list = [];
            $child_qty_list = explode(",", $lims_product_data->qty_list);

            foreach ($child_product_list as $index => $child_id) {
                $child_data = Product::find($child_id);
                if(count($child_variant_list) && $child_variant_list[$index]) {
                    $child_product_variant_data = ProductVariant::where([
                        ['product_id', $child_id],
                        ['variant_id', $child_variant_list[$index]]
                    ])->first();

                    $child_warehouse_data = Product_Warehouse::where([
                        ['product_id', $child_id],
                        ['variant_id', $child_variant_list[$index]],
                        ['warehouse_id', $lims_production_data->warehouse_id ],
                    ])->first();

                    $child_product_variant_data->qty += $reduced_qty * $child_qty_list[$index];
                    $child_product_variant_data->save();
                }
                else {
                    $child_warehouse_data = Product_Warehouse::where([
                        ['product_id', $child_id],
                        ['warehouse_id', $lims_production_data->warehouse_id ],
                    ])->first();
                }

                $child_data->qty += $reduced_qty * $child_qty_list[$index];
                $child_warehouse_data->qty += $reduced_qty * $child_qty_list[$index];

                $child_data->save();
                $child_warehouse_data->save();
            }

            //decucting qty from the combo
            $lims_product_data->qty -= $recieved_qty;
            $lims_product_warehouse_data->qty -= $recieved_qty;

            $lims_product_warehouse_data->save();
            $lims_product_data->save();
            $product_production_data->delete();
        }

        if(file_exists('documents/production/'. $lims_production_data->document))
            unlink('documents/production/'. $lims_production_data->document);
        $lims_production_data->delete();

        return redirect('productions')->with('not_permitted', 'Production deleted successfully');;
    }
}
