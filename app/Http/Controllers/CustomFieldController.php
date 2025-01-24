<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CustomField;
use DB;
use Spatie\Permission\Models\Role;
use Auth;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;

class CustomFieldController extends Controller
{
    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('custom_field')) {
            $lims_custom_field_all = CustomField::orderBy('id', 'desc')->get();
            return view('backend.custom_field.index', compact('lims_custom_field_all'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function create()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('custom_field')) {
            return view('backend.custom_field.create');
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function store(Request $request)
    {
        if(!env('USER_VERIFIED'))
            return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');

        $data = $request->all();
        //adding column to specific database
        if($data['belongs_to'] == 'sale')
            $table_name = 'sales';
        elseif($data['belongs_to'] == 'purchase')
            $table_name = 'purchases';
        elseif($data['belongs_to'] == 'product')
            $table_name = 'products';
        elseif($data['belongs_to'] == 'customer')
            $table_name = 'customers';

        $column_name = str_replace(" ", "_", strtolower($data['name']));

        // $column_name = str_replace("( ", "`(", strtolower($data['name']));
        // $column_name = str_replace(") ", ")`", strtolower($data['name']));


        if($data['type'] == 'number')
            $data_type = 'double';
        elseif($data['type'] == 'textarea')
            $data_type = 'text';
        else
            $data_type = 'varchar(255)';
        $sqlStatement = "ALTER TABLE ". $table_name . " ADD `" . $column_name . "` " . $data_type;
        if($data['default_value_1']) {
            $sqlStatement .= " DEFAULT '" . $data['default_value_1'] . "'";
            $data['default_value'] = $data['default_value_1'];
        }
        elseif($data['default_value_2']) {
            $sqlStatement .= " DEFAULT '" . $data['default_value_2'] . "'";
            $data['default_value'] = $data['default_value_2'];
        }
        DB::insert($sqlStatement);
        //adding data to custom fields table
        if(isset($data['is_table']))
            $data['is_table'] = true;
        else
            $data['is_table'] = false;

        if(isset($data['is_invoice']))
            $data['is_invoice'] = true;
        else
            $data['is_invoice'] = false;

        if(isset($data['is_required']))
            $data['is_required'] = true;
        else
            $data['is_required'] = false;

        if(isset($data['is_admin']))
            $data['is_admin'] = true;
        else
            $data['is_admin'] = false;

        if(isset($data['is_disable']))
            $data['is_disable'] = true;
        else
            $data['is_disable'] = false;
        CustomField::create($data);
        return redirect()->route('custom-fields.index')->with('message', 'Custom Field created successfully');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('custom_field')) {
            $custom_field_data = CustomField::find($id);
            return view('backend.custom_field.edit', compact('custom_field_data'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }


    public function update(Request $request, $id)
    {
        // Validate the request
        $request->validate([
            'belongs_to' => 'required|string',
            'name' => 'required|string|max:255',
            'type' => 'required|string',
            'grid_value' => 'required|integer|min:1|max:12',
        ]);

        // Retrieve the custom field record
        $customField = CustomField::findOrFail($id);

        // Map the 'belongs_to' value to table names
        $tableName = $this->getTableName($customField->belongs_to);

        if (!$tableName || !Schema::hasTable($tableName)) {
            return back()->withErrors(['message' => __('The specified table does not exist.')]);
        }

        // Check if the column name has changed
        if ($customField->name !== $request->name) {

            // if (Schema::hasColumn($tableName, $customField->name)) {
                // Rename the column in the database
                // Schema::table($tableName, function (Blueprint $table) use ($customField, $request) {
                //     $table->renameColumn($customField->name, $request->name);
                // });

            // } else {
            //     return back()->withErrors(['message' => __('The column ":name" does not exist in the ":table" table.', [
            //         'name' => $customField->name,
            //         'table' => $tableName,
            //     ])]);
            // }
        }

        // Update column type if necessary
        Schema::table($tableName, function (Blueprint $table) use ($request) {
            $this->modifyColumnType($table, $request->name, $request->type);
        });

        // $data = $request->all();
        // return $data;
        // Update custom field record in the database
        $customField->update([
            'belongs_to' => $request->belongs_to,
            'name' => $request->name,
            'type' => $request->type,
            'default_value' => $request->input('default_value_1') ?? $request->input('default_value_2'),
            'option_value' => $request->input('option_value'),
            'grid_value' => $request->grid_value,
            'is_table' => $request->has('is_table'),
            'is_invoice' => $request->has('is_invoice'),
            'is_required' => $request->has('is_required'),
            'is_admin' => $request->has('is_admin'),
            'is_disable' => $request->has('is_disable'),
        ]);

        return redirect()->route('custom-fields.index')->with('message', __('Custom Field updated successfully.'));
    }

    private function getTableName($belongsTo)
    {
        return [
            'product' => 'products',
            'sale' => 'sales',
            'purchase' => 'purchases',
            'customer' => 'customers',
        ][$belongsTo] ?? null;
    }

    private function modifyColumnType(Blueprint $table, $columnName, $type)
    {
        if (Schema::hasColumn($table->getTable(), $columnName)) {
            switch ($type) {
                case 'text':
                    $table->string($columnName)->change();
                    break;
                case 'number':
                    $table->integer($columnName)->change();
                    break;
                case 'textarea':
                    $table->text($columnName)->change();
                    break;
                case 'date_picker':
                    $table->date($columnName)->change();
                    break;
                default:
                    $table->string($columnName)->change();
            }
        }
    }





    public function destroy($id)
    {
        if (!env('USER_VERIFIED')) {
            return redirect()->back()->with('not_permitted', 'This feature is disabled for demo!');
        }

        $custom_field_data = CustomField::find($id);

        if (!$custom_field_data) {
            return redirect()->back()->with('not_permitted', 'Custom Field not found!');
        }

        // Determine the table name based on 'belongs_to' field
        $table_name = $this->getTableName($custom_field_data->belongs_to);

        if (!$table_name) {
            return redirect()->back()->with('not_permitted', 'Invalid custom field table!');
        }

        // Convert the custom field name to a column name (lowercase, spaces replaced by underscores)
        $column_name = str_replace(" ", "_", strtolower($custom_field_data->name));

        // Check if the column exists and drop it
        if (Schema::hasColumn($table_name, $column_name)) {
            // Drop the column from the table
            Schema::table($table_name, function (Blueprint $table) use ($column_name) {
                $table->dropColumn($column_name);
            });
        }

        // Delete the custom field data from the database
        $custom_field_data->delete();

        return redirect()->back()->with('not_permitted', 'Custom Field deleted successfully!');
    }
}
