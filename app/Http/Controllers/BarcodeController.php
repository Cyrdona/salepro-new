<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Barcode;
use DB; 

class BarcodeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return view('backend.barcode.index');
    }

    public function barcodeData(Request $request)
    {

        $columns = array(
            0 =>'id',
            2 =>'name',
            3=> 'description',
        );

        $totalData = DB::table('barcodes')->where('is_custom',true)->count();
        $totalFiltered = $totalData;

        if($request->input('length') != -1)
            $limit = $request->input('length');
        else
            $limit = $totalData;
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        if(empty($request->input('search.value')))
            $barcodes = Barcode::offset($start)
                        ->where('is_custom',true)
                        ->limit($limit)
                        ->orderBy($order,$dir)
                        ->get();
        else
        {
            $search = $request->input('search.value');
            $barcodes =  Barcode::where([
                            ['name', 'LIKE', "%{$search}%"],
                            ['is_custom', true]
                        ])->offset($start)
                        ->limit($limit)
                        ->orderBy($order,$dir)->get();

            $totalFiltered = Barcode::where([
                                ['name', 'LIKE', "%{$search}%"],
                                ['is_custom', true]
                        ])->count();
        }
        $data = array();
        if(!empty($barcodes))
        {
            foreach ($barcodes as $key=>$barcode)
            {
                $nestedData['id'] = $barcode->id;
                $nestedData['key'] = $key;
                $nestedData['name'] = $barcode->name;
                $nestedData['description'] = $barcode->description;

                $nestedData['options'] = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.trans("file.action").'
                            <span class="caret"></span>
                            <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <a  href="'.route('barcodes.edit', $barcode->id).'" class="btn btn-link"><i class="dripicons-document-edit"></i> '.trans("file.edit").'</a>
                                </li>
                                <li class="divider"></li>'.
                                \Form::open(["route" => ["barcodes.destroy", $barcode->id], "method" => "DELETE"] ).'
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
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('backend.barcode.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $input = $request->only(['name', 'description', 'width', 'height', 'top_margin',
                'left_margin', 'row_distance', 'col_distance',
                'stickers_in_one_row', 'paper_width','is_custom' ]);

            if (! empty($request->input('is_default'))) {
                //get_default
                $default = Barcode::where('is_default', 1)
                                ->update(['is_default' => 0]);
                $input['is_default'] = 1;
            }
            if (! empty($request->input('is_continuous'))) {
                $input['is_continuous'] = 1;
                $input['stickers_in_one_sheet'] = 28;
            } else {
                $input['stickers_in_one_sheet'] = $request->input('stickers_in_one_sheet');
                $input['paper_height'] = $request->input('paper_height');
            }
            $barcode = Barcode::create($input);
            $output = ['success' => 1,
                'msg' => __('barcode.added_success'),
            ];
        } catch (\Exception $e) {
            \Log::emergency('File:'.$e->getFile().'Line:'.$e->getLine().'Message:'.$e->getMessage());

            $output = ['success' => 0,
                'msg' => __('messages.something_went_wrong'),
            ];
        }

        return redirect('barcodes')->with('status', $output);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $barcode = Barcode::where('is_custom',true)->find($id);

        return view('backend.barcode.edit',compact('barcode'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $input = $request->only(['name', 'description', 'width', 'height', 'top_margin',
                'left_margin', 'row_distance', 'col_distance',
                'stickers_in_one_row', 'paper_width', 'is_custom' ]);

            if (! empty($request->input('is_continuous'))) {
                $input['is_continuous'] = 1;
                $input['stickers_in_one_sheet'] = 28;
                $input['paper_height'] = 0;
            } else {
                $input['is_continuous'] = 0;
                $input['stickers_in_one_sheet'] = $request->input('stickers_in_one_sheet');
                $input['paper_height'] = $request->input('paper_height');
            }

            if (! empty($request->input('is_default'))) {
                //get_default
                $default = Barcode::where('is_default', 1)
                                ->update(['is_default' => 0]);
                $input['is_default'] = 1;
                Barcode::where('id', $id)->update($input);

            }

                Barcode::where('id', $id)->update($input);

            $output = ['success' => 1,
                'msg' => __('barcode.updated_success'),
            ];
        } catch (\Exception $e) {
            \Log::emergency('File:'.$e->getFile().'Line:'.$e->getLine().'Message:'.$e->getMessage());

            $output = ['success' => 0,
                'msg' => __('messages.something_went_wrong'),
            ];
        }

        return redirect('barcodes')->with('status', $output);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
