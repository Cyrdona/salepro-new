<?php

namespace App\Http\Controllers;

use App\Models\IncomeCategory;
use Illuminate\Http\Request;
use Keygen;
use DB;
use Illuminate\Validation\Rule;

class IncomeCategoryController extends Controller
{
    
    public function index()
    {
        $lims_income_category_all = IncomeCategory::where('is_active', true)->get();
        return view('backend.income_category.index', compact('lims_income_category_all'));
    }

 
    public function create()
    {
        //
    }

    public function generateCode()
    {
        $id = Keygen::numeric(8)->generate();
        return $id;
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'code' => [
                'max:255',
                    Rule::unique('income_categories')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ]
        ]);

        $data = $request->all();
        IncomeCategory::create($data);
        return redirect('income_categories')->with('message', 'Data inserted successfully');
    }

    public function show(string $id)
    {
        
    }

    public function edit(string $id)
    {
        $lims_income_category_data = IncomeCategory::find($id);
        return $lims_income_category_data;
    }

    public function update(Request $request, string $id)
    {
        $this->validate($request, [
            'code' => [
                'max:255',
                    Rule::unique('income_categories')->ignore($request->income_category_id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ]
        ]);

        $data = $request->all();
        $lims_income_category_data = IncomeCategory::find($data['income_category_id']);
        $lims_income_category_data->update($data);
        return redirect('income_categories')->with('message', 'Data updated successfully');
    }

    public function destroy(string $id)
    {
        $lims_income_category_data = IncomeCategory::find($id);
        $lims_income_category_data->is_active = false;
        $lims_income_category_data->save();
        return redirect('income_categories')->with('not_permitted', 'Data deleted successfully');
    }
}
