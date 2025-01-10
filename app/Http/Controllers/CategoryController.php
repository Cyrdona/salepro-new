<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Category;
use App\Models\Product;
use DB;
use Auth;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Validation\Rule;
use App\Traits\TenantInfo;
use App\Traits\CacheForget;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;

class CategoryController extends Controller
{
    use CacheForget;
    use TenantInfo;

    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('category')) {
            return view('backend.category.create');
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function categoryData(Request $request)
    {
        $columns = array(
            0 =>'id',
            2 =>'name',
            3=> 'parent_id',
            4=> 'is_active',
        );

        $totalData = DB::table('categories')->where('is_active', true)->count();
        $totalFiltered = $totalData;

        if($request->input('length') != -1)
            $limit = $request->input('length');
        else
            $limit = $totalData;
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        if(empty($request->input('search.value')))
            $categories = Category::offset($start)
                        ->where('is_active', true)
                        ->limit($limit)
                        ->orderBy($order,$dir)
                        ->get();
        else
        {
            $search = $request->input('search.value');
            $categories =  Category::where([
                            ['name', 'LIKE', "%{$search}%"],
                            ['is_active', true]
                        ])->offset($start)
                        ->limit($limit)
                        ->orderBy($order,$dir)->get();

            $totalFiltered = Category::where([
                            ['name','LIKE',"%{$search}%"],
                            ['is_active', true]
                        ])->count();
        }
        $data = array();
        if(!empty($categories))
        {
            foreach ($categories as $key=>$category)
            {
                $nestedData['id'] = $category->id;
                $nestedData['key'] = $key;

                if($category->image)
                    $nestedData['name'] = '<img src="'.url('images/category', $category->image).'" height="80" width="80">'.$category->name;
                else
                    $nestedData['name'] = '<img src="'.url('images/zummXD2dvAtI.png').'" height="80" width="80">'.$category->name;

                if($category->parent_id)
                    $nestedData['parent_id'] = Category::find($category->parent_id)->name;
                else
                    $nestedData['parent_id'] = "N/A";

                $nestedData['number_of_product'] = $category->product()->where('is_active', true)->count();
                $nestedData['stock_qty'] = $category->product()->where('is_active', true)->sum('qty');
                $total_price = $category->product()->where('is_active', true)->sum(DB::raw('price * qty'));
                $total_cost = $category->product()->where('is_active', true)->sum(DB::raw('cost * qty'));

                if(config('currency_position') == 'prefix')
                    $nestedData['stock_worth'] = config('currency').' '.$total_price.' / '.config('currency').' '.$total_cost;
                else
                    $nestedData['stock_worth'] = $total_price.' '.config('currency').' / '.$total_cost.' '.config('currency');

                $nestedData['options'] = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.trans("file.action").'
                              <span class="caret"></span>
                              <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" data-id="'.$category->id.'" class="open-EditCategoryDialog btn btn-link" data-toggle="modal" data-target="#editModal" ><i class="dripicons-document-edit"></i> '.trans("file.edit").'</button>
                                </li>
                                <li class="divider"></li>'.
                                \Form::open(["route" => ["category.destroy", $category->id], "method" => "DELETE"] ).'
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

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => [
                'max:255',
                    Rule::unique('categories')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
            'image' => 'image|mimes:jpg,jpeg,png,gif',
            'icon'  => 'mimetypes:text/plain,image/png,image/jpeg,image/svg',
        ]);
        
        $image = $request->image;
        if ($image) {
            $ext = pathinfo($image->getClientOriginalName(), PATHINFO_EXTENSION);
            $imageName = date("Ymdhis");
            if(!config('database.connections.saleprosaas_landlord')) {
                $imageName = $imageName . '.' . $ext;
                $image->move(public_path('images/category'), $imageName);
            }
            else {
                $imageName = $this->getTenantId() . '_' . $imageName . '.' . $ext;
                $image->move(public_path('images/category'), $imageName);
            }
            if (!file_exists(public_path('images/category/large/'))) {
                mkdir(public_path('images/category/large/'), 0755, true);
            }
            $manager = new ImageManager(Driver::class);
            $image = $manager->read(public_path('images/category/'). $imageName);

            $image->cover(600, 750)->save(public_path('images/category/large/'). $imageName, 100);

            $image->cover(300, 300)->save();


            $lims_category_data['image'] = $imageName;
        }
        $icon = $request->icon;
        if ($icon) {
            if (!file_exists(public_path('images/category/icons/'))) {
                mkdir(public_path('images/category/icons/'), 0755, true);
            }
            $ext = pathinfo($icon->getClientOriginalName(), PATHINFO_EXTENSION);
            $iconName = date("Ymdhis");
            if(!config('database.connections.saleprosaas_landlord')) {
                $iconName = $iconName . '.' . $ext;
                $icon->move(public_path('images/category/icons/'), $iconName);
            }
            else {
                $iconName = $this->getTenantId() . '_' . $iconName . '.' . $ext;
                $icon->move(public_path('images/category/icons/'), $iconName);
            }
            $manager = new ImageManager(Driver::class);
            $image = $manager->read(public_path('images/category/icons/'). $iconName);

            $image->cover(100, 100)->save();
            
            $lims_category_data['icon'] = $iconName;
        }
        $lims_category_data['name'] = preg_replace('/\s+/', ' ', $request->name);
        $lims_category_data['parent_id'] = $request->parent_id;
        $lims_category_data['is_active'] = true;
        if(isset($request->ajax))
            $lims_category_data['ajax'] = $request->ajax;
        else
            $lims_category_data['ajax'] = 0;
       
        if(isset($request->is_sync_disable))
            $lims_category_data['is_sync_disable'] = $request->is_sync_disable;

        if(in_array('ecommerce', explode(',',config('addons')))) {
            $lims_category_data['slug'] = Str::slug($request->name, '-');
            if($request->featured == 1){
                $lims_category_data['featured'] = 1;
            } else {
                $lims_category_data['featured'] = 0;
            }
            $lims_category_data['page_title'] = $request->page_title;
            $lims_category_data['short_description'] = $request->short_description;
        }
        $category = Category::create($lims_category_data);

        $this->cacheForget('category_list');
        if($lims_category_data['ajax'])
            return $category;
        else
            return redirect('category')->with('message', 'Category inserted successfully');
    }

    public function edit($id)
    {
        $lims_category_data = DB::table('categories')->where('id', $id)->first();
        $lims_parent_data = DB::table('categories')->where('id', $lims_category_data->parent_id)->first();
        if($lims_parent_data){
            $lims_category_data->parent = $lims_parent_data->name;
        }
        return $lims_category_data;
    }

    public function update(Request $request)
    {
        if(!env('USER_VERIFIED'))
            return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');
        
        $this->validate($request,[
            'name' => [
                'max:255',
                Rule::unique('categories')->ignore($request->category_id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
            'image' => 'image|mimes:jpg,jpeg,png,gif',
            'icon'  => 'mimetypes:text/plain,image/png,image/jpeg,image/svg',
        ]);

        $lims_category_data = DB::table('categories')->where('id', $request->category_id)->first();

        $input = $request->except('image','icon','_method','_token','category_id');

        $image = $request->image;
        if ($image) {
            $this->fileDelete(public_path('images/category/'),$lims_category_data->image);

            $ext = pathinfo($image->getClientOriginalName(), PATHINFO_EXTENSION);
            $imageName = date("Ymdhis");
            if(!config('database.connections.saleprosaas_landlord')) {
                $imageName = $imageName . '.' . $ext;
                $image->move(public_path('images/category'), $imageName);
            }
            else {
                $imageName = $this->getTenantId() . '_' . $imageName . '.' . $ext;
                $image->move(public_path('images/category'), $imageName);
            }
            $manager = new ImageManager(Driver::class);
            $image = $manager->read(public_path('images/category/'). $imageName);

            $image->cover(600, 750)->save(public_path('images/category/large/'). $imageName, 100);

            $image->cover(300, 300)->save();
             
            $input['image'] = $imageName;
        }

        $icon = $request->icon;
        if ($icon) {
            if (!file_exists(public_path('images/category/icons/'))) {
                mkdir(public_path('images/category/icons/'), 0755, true);
            }
            $this->fileDelete(public_path('images/category/icons/'), $lims_category_data->icon);

            $ext = pathinfo($icon->getClientOriginalName(), PATHINFO_EXTENSION);
            $iconName = date("Ymdhis");
            if(!config('database.connections.saleprosaas_landlord')) {
                $iconName = $iconName . '.' . $ext;
                $icon->move(public_path('images/category/icons/'), $iconName);
            }
            else {
                $iconName = $this->getTenantId() . '_' . $iconName . '.' . $ext;
                $icon->move(public_path('images/category/icons/'), $iconName);
            }
            $manager = new ImageManager(Driver::class);
            $image = $manager->read(public_path('images/category/icons/'). $iconName);

            $image->cover(100, 100)->save();

            $input['icon'] = $iconName;
        }
        if(!isset($request->featured) && \Schema::hasColumn('categories', 'featured') ){
            $input['featured'] = 0;
        }
        if(!isset($input['is_sync_disable']) && \Schema::hasColumn('categories', 'is_sync_disable'))
            $input['is_sync_disable'] = null;

        if(in_array('ecommerce', explode(',',config('addons')))) {
            $input['slug'] = Str::slug($request->name, '-');
            if($request->featured == 1){
                $input['featured'] = 1;
            } else {
                $input['featured'] = 0;
            }
            $input['page_title'] = $request->page_title;
            $input['short_description'] = $request->short_description;
        }

        DB::table('categories')->where('id', $request->category_id)->update($input);
        
        return redirect('category')->with('message', 'Category updated successfully');
    }

    public function import(Request $request)
    {
        //get file
        $upload=$request->file('file');
        $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
        if($ext != 'csv')
            return redirect()->back()->with('not_permitted', 'Please upload a CSV file');
        $filename =  $upload->getClientOriginalName();
        $filePath=$upload->getRealPath();
        //open and read
        $file=fopen($filePath, 'r');
        $header= fgetcsv($file);
        $escapedHeader=[];
        //validate
        foreach ($header as $key => $value) {
            $lheader=strtolower($value);
            $escapedItem=preg_replace('/[^a-z]/', '', $lheader);
            array_push($escapedHeader, $escapedItem);
        }
        //looping through othe columns
        while($columns=fgetcsv($file))
        {
            if($columns[0]=="")
                continue;
            foreach ($columns as $key => $value) {
                $value=preg_replace('/\D/','',$value);
            }
            $data= array_combine($escapedHeader, $columns);
            $category = Category::firstOrNew(['name' => $data['name'], 'is_active' => true ]);
            if($data['parentcategory']){
                $parent_category = Category::firstOrNew(['name' => $data['parentcategory'], 'is_active' => true ]);
                $parent_id = $parent_category->id;
            }
            else
                $parent_id = null;

            if(in_array('ecommerce', explode(',',config('addons')))) {
                $input['slug'] = Str::slug($data['name'], '-');
            }

            $category->parent_id = $parent_id;
            $category->is_active = true;
            $category->save();
        }
        $this->cacheForget('category_list');
        return redirect('category')->with('message', 'Category imported successfully');
    }

    public function deleteBySelection(Request $request)
    {
        $category_id = $request['categoryIdArray'];
        foreach ($category_id as $id) {
            $lims_product_data = Product::where('category_id', $id)->get();
            foreach ($lims_product_data as $product_data) {
                $product_data->is_active = false;
                $product_data->save();
            }
            $lims_category_data = Category::findOrFail($id);
            $lims_category_data->is_active = false;
            $lims_category_data->save();

            $this->fileDelete(public_path('images/category/'),$lims_category_data->image);
            $this->fileDelete(public_path('images/category/icons/'),$lims_category_data->icon);
        }
        $this->cacheForget('category_list');
        return 'Category deleted successfully!';
    }

    public function destroy($id)
    {
        $lims_category_data = Category::findOrFail($id);
        $lims_category_data->is_active = false;
        $lims_product_data = Product::where('category_id', $id)->get();
        foreach ($lims_product_data as $product_data) {
            $product_data->is_active = false;
            $product_data->save();
        }

        $this->fileDelete(public_path('images/category/'),$lims_category_data->image);
        $this->fileDelete(public_path('images/category/icons/'),$lims_category_data->icon);

        $lims_category_data->save();
        $this->cacheForget('category_list');
        return redirect('category')->with('not_permitted', 'Category deleted successfully');
    }
}
