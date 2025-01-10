<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Income;
use App\Models\Account;
use App\Models\Warehouse;
use App\Models\CashRegister;
use App\Traits\StaffAccess;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;
use DB;

class IncomeController extends Controller
{
    use StaffAccess;

    public function index(Request $request)
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('incomes-index')){
            $permissions = Role::findByName($role->name)->permissions;
            foreach ($permissions as $permission)
                $all_permission[] = $permission->name;
            if(empty($all_permission))
                $all_permission[] = 'dummy text';

            if($request->starting_date) {
                $starting_date = $request->starting_date;
                $ending_date = $request->ending_date;
            }
            else {
                $starting_date = date('Y-m-01', strtotime('-1 year', strtotime(date('Y-m-d'))));
                $ending_date = date("Y-m-d");
            }

            if($request->input('warehouse_id'))
                $warehouse_id = $request->input('warehouse_id');
            else
                $warehouse_id = 0;

            $lims_warehouse_list = Warehouse::select('name', 'id')->where('is_active', true)->get();
            $lims_account_list = Account::where('is_active', true)->get();
            return view('backend.income.index', compact('lims_account_list', 'lims_warehouse_list', 'all_permission', 'starting_date', 'ending_date', 'warehouse_id'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function incomeData(Request $request)
    {
        $columns = array(
            1 => 'created_at',
            2 => 'reference_no',
        );

        $warehouse_id = $request->input('warehouse_id');
        $q = Income::whereDate('created_at', '>=' ,$request->input('starting_date'))
                     ->whereDate('created_at', '<=' ,$request->input('ending_date'));
        //check staff access
        $this->staffAccessCheck($q);
        if($warehouse_id)
            $q = $q->where('warehouse_id', $warehouse_id);

        $totalData = $q->count();
        $totalFiltered = $totalData;

        if($request->input('length') != -1)
            $limit = $request->input('length');
        else
            $limit = $totalData;
        $start = $request->input('start');
        $order = 'incomes.'.$columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        if(empty($request->input('search.value'))) {
            $q = Income::with('warehouse', 'incomeCategory')
                ->whereDate('created_at', '>=' ,$request->input('starting_date'))
                ->whereDate('created_at', '<=' ,$request->input('ending_date'))
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir);
            //check staff access
            $this->staffAccessCheck($q);
            if($warehouse_id)
                $q = $q->where('warehouse_id', $warehouse_id);
            $incomes = $q->get();
        }
        else
        {
            $search = $request->input('search.value');
            $q = Income::whereDate('incomes.created_at', '=' , date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                ->offset($start)
                ->limit($limit)
                ->orderBy($order,$dir);
            if(Auth::user()->role_id > 2 && config('staff_access') == 'own') {
                $incomes =  $q->select('incomes.*')
                                ->with('warehouse', 'incomeCategory')
                                ->where('incomes.user_id', Auth::id())
                                ->orwhere([
                                    ['reference_no', 'LIKE', "%{$search}%"],
                                    ['user_id', Auth::id()]
                                ])
                                ->get();
                $totalFiltered = $q->where('incomes.user_id', Auth::id())->count();
            }
            elseif(Auth::user()->role_id > 2 && config('staff_access') == 'warehouse') {
                $incomes =  $q->select('incomes.*')
                                ->with('warehouse', 'incomeCategory')
                                ->where('incomes.user_id', Auth::id())
                                ->orwhere([
                                    ['reference_no', 'LIKE', "%{$search}%"],
                                    ['warehouse_id', Auth::user()->warehouse_id]
                                ])
                                ->get();
                $totalFiltered = $q->where('incomes.user_id', Auth::id())->count();
            }
            else {
                $incomes =  $q->select('incomes.*')
                                ->with('warehouse', 'incomeCategory')
                                ->orwhere('reference_no', 'LIKE', "%{$search}%")
                                ->get();

                $totalFiltered = $q->orwhere('incomes.reference_no', 'LIKE', "%{$search}%")->count();
            }
        }
        $data = array();
        if(!empty($incomes))
        {
            foreach ($incomes as $key=>$income)
            {
                $nestedData['id'] = $income->id;
                $nestedData['key'] = $key;
                $nestedData['date'] = date(config('date_format'), strtotime($income->created_at->toDateString()));
                $nestedData['reference_no'] = $income->reference_no;
                $nestedData['warehouse'] = $income->warehouse->name;
                $nestedData['incomeCategory'] = $income->incomeCategory->name;
                $nestedData['amount'] = number_format($income->amount, config('decimal'));
                $nestedData['note'] = $income->note;
                $nestedData['options'] = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.trans("file.action").'
                              <span class="caret"></span>
                              <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">';
                if(in_array("incomes-edit", $request['all_permission'])) {
                    $nestedData['options'] .= '<li>
                        <button type="button" data-id="'.$income->id.'" class="open-Editincome_categoryDialog btn btn-link" data-toggle="modal" data-target="#editModal"><i class="dripicons-document-edit"></i>'.trans('file.edit').'</button>
                        </li>';
                }
                if(in_array("incomes-delete", $request['all_permission']))
                    $nestedData['options'] .= \Form::open(["route" => ["incomes.destroy", $income->id], "method" => "DELETE"] ).'
                            <li>
                              <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> '.trans("file.delete").'</button>
                            </li>'.\Form::close().'
                        </ul>
                    </div>';
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
        //
    }

    public function store(Request $request)
    {
        $data = $request->all();
        if(isset($data['created_at']))
            $data['created_at'] = date("Y-m-d H:i:s", strtotime($data['created_at']));
        else
            $data['created_at'] = date("Y-m-d H:i:s");
        $data['reference_no'] = 'ir-' . date("Ymd") . '-'. date("his");
        $data['user_id'] = Auth::id();
        $cash_register_data = CashRegister::where([
            ['user_id', $data['user_id']],
            ['warehouse_id', $data['warehouse_id']],
            ['status', true]
        ])->first();
        if($cash_register_data)
            $data['cash_register_id'] = $cash_register_data->id;
        Income::create($data);
        return redirect('incomes')->with('message', 'Data inserted successfully');
    }

    public function show(string $id)
    {
        //
    }

    public function edit($id)
    {
        $role = Role::firstOrCreate(['id' => Auth::user()->role_id]);
        if ($role->hasPermissionTo('incomes-edit')) {
            $lims_income_data = Income::find($id);
            $lims_income_data->date = date('d-m-Y', strtotime($lims_income_data->created_at->toDateString()));
            return $lims_income_data;
        }
       else
           return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function update(Request $request, $id)
    {
        $data = $request->all();
        $lims_income_data = Income::find($data['income_id']);
        $data['created_at'] = date("Y-m-d H:i:s", strtotime($data['created_at']));
        $lims_income_data->update($data);
        return redirect('incomes')->with('message', 'Data updated successfully');
    }

    public function deleteBySelection(Request $request)
    {
        $income_id = $request['incomeIdArray'];
        foreach ($income_id as $id) {
            $lims_income_data = Income::find($id);
            $lims_income_data->delete();
        }
        return 'income deleted successfully!';
    }

    public function destroy(string $id)
    {
        $lims_income_data = Income::find($id);
        $lims_income_data->delete();
        return redirect('incomes')->with('not_permitted', 'Data deleted successfully');
    }
}
