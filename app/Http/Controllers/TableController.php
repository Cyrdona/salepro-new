<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Table;
use App\Models\GeneralSetting;
use DB;

class TableController extends Controller
{
    use \App\Traits\CacheForget;
    public function index()
    {
        $lims_table_all = Table::where('is_active', true)->get();

        $general_setting = GeneralSetting::latest()->first();
        if(in_array('restaurant',explode(',',$general_setting->modules))){
            $floors = DB::table('floors')->get();

            return view('backend.table.index', compact('lims_table_all','floors'));
        }

        return view('backend.table.index', compact('lims_table_all'));
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $data = $request->all();
        $data['is_active'] = true;
        $new = Table::create($data);

        $general_setting = GeneralSetting::latest()->first();
        if(in_array('restaurant',explode(',',$general_setting->modules))){
            $floor = DB::table('floors')->where('id',$request->floor_id)->first();
            $newTable = [
                'id' => $new->id, // Unique ID for the new table
                'x' => 0,    // Default x coordinate
                'y' => 0,    // Default y coordinate
                'width' => 100, // Default width
                'height' => 100, // Default height
                'name' => $new->name .'('.$new->number_of_person.')' // Name of the new table
            ];

            $floorplan = json_decode($floor->floorplan, true);

            // Add the new table to the floorplan
            $floorplan[] = $newTable;

            // Save the updated floorplan back to the database
            DB::table('floors')
                ->where('id', $floor->id)
                ->update(['floorplan' => json_encode($floorplan)]);
        }

        $this->cacheForget('table_list');
        return redirect()->back()->with('message', 'Table created successfully');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        $table = Table::find($request->table_id);
        $floor_prev_id = $table->floor_id;
        $table->update($request->all());

        $general_setting = GeneralSetting::latest()->first();
        if(in_array('restaurant',explode(',',$general_setting->modules))){

            if($floor_prev_id != $request->floor_id){
                $floor_prev = DB::table('floors')->where('id',$floor_prev_id)->first();
                $floorplan_prev = json_decode($floor_prev->floorplan, true);

                $table_id = $request->table_id;

                // Remove the table from the floorplan
                $updatedFloorplan = array_filter($floorplan_prev, function ($item) use ($table_id) {
                    return $item['id'] != $table_id;
                });

                // Save the updated floorplan back to the database
                DB::table('floors')
                    ->where('id', $floor_prev_id)
                    ->update(['floorplan' => json_encode(array_values($updatedFloorplan))]);

                $newTable = [
                    'id' => $request->table_id, // Unique ID for the new table
                    'x' => 0,    // Default x coordinate
                    'y' => 0,    // Default y coordinate
                    'width' => 100, // Default width
                    'height' => 100, // Default height
                    'name' => $request->name.'('.$request->number_of_person.')' // Name of the new table
                ];

                $floor = DB::table('floors')->where('id',$request->floor_id)->first();
                $floorplan = json_decode($floor->floorplan, true);

                $floorplan[] = $newTable;
                
                // Save the updated floorplan back to the database
                DB::table('floors')
                    ->where('id', $floor->id)
                    ->update(['floorplan' => json_encode($floorplan)]);

            }else{
                $floor = DB::table('floors')->where('id',$request->floor_id)->first();
                $floorplan = json_decode($floor->floorplan, true);

                if(isset($floorplan)){
                    foreach ($floorplan as &$item) {
                        if ($item['id'] == $request->table_id) {
                            $item['name'] = $request->name.'('.$request->number_of_person.')'; // Update the name only
                            break;
                        }
                    }
                }else{
                    $newTable = [
                        'id' => $request->table_id, // Unique ID for the new table
                        'x' => 0,    // Default x coordinate
                        'y' => 0,    // Default y coordinate
                        'width' => 100, // Default width
                        'height' => 100, // Default height
                        'name' => $request->name.'('.$request->number_of_person.')' // Name of the new table
                    ];

                    $floorplan[] = $newTable;
                }
                
                // Save the updated floorplan back to the database
                DB::table('floors')
                    ->where('id', $floor->id)
                    ->update(['floorplan' => json_encode($floorplan)]);

            }
        }

        $this->cacheForget('table_list');
        return redirect()->back()->with('message', 'Table updated successfully');
    }

    public function destroy($id)
    {
        $table = Table::find($id);
        $table->update(['is_active'=>false]);

        $general_setting = GeneralSetting::latest()->first();
        if(in_array('restaurant',explode(',',$general_setting->modules))){
            $floor = DB::table('floors')->where('id',$table->floor_id)->first();
            $floorplan = json_decode($floor->floorplan, true);

            $table_id = $table->id;

            // Remove the table from the floorplan
            $updatedFloorplan = array_filter($floorplan, function ($item) use ($table_id) {
                return $item['id'] != $table_id;
            });

            // Save the updated floorplan back to the database
            DB::table('floors')
                ->where('id', $table->floor_id)
                ->update(['floorplan' => json_encode(array_values($updatedFloorplan))]);
        }

        $this->cacheForget('table_list');
        return redirect()->back()->with('message', 'Table deleted successfully');
    }
}
