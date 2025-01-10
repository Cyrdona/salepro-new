<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use ZipArchive;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use App\Models\Category;
use App\Models\Brand;
use App\Models\Product;
use DB;
use URL;

class AddonInstallController extends Controller
{
    public function woocommerceInstall(Request $request)
    {
        if(!env('USER_VERIFIED'))
            return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');
        
        $data = [
            'purchase_code' => $request->purchase_code,
            'product' => 46380606
        ];

        $url = 'https://lion-coders.com/addon-install/';
            
        $ch = curl_init(); // Initialize cURL

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_POSTREDIR, 3);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 3);

        $response = curl_exec($ch);

        curl_close($ch);

        if($response != 0) {
            $remote_file_path = $response;
            $remote_file_name = basename($remote_file_path);
            $local_file_path = base_path('/Modules/'.$remote_file_name);
            $copy = copy($remote_file_path, $local_file_path);
            if ($copy) {
                // ****** Unzip ********
                $zip = new ZipArchive;
                $file = $local_file_path;
                $res = $zip->open($file);
                if ($res === TRUE) {
                    $zip->extractTo(base_path('/Modules/'));
                    $zip->close();
                    // ****** Delete Zip File ******
                    File::delete($file);
                }
                
                $data = [
                    'path' => $response,
                ];

                $url = 'https://lion-coders.com/addon-db/';
            
                $ch = curl_init(); // Initialize cURL

                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
                curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
                curl_setopt($ch, CURLOPT_POSTREDIR, 3);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 3);

                $res = curl_exec($ch);

                curl_close($ch);

                \Artisan::call('migrate');
            }
            
            $settings = DB::table('general_settings')->select('id','modules')->first();
            if(isset($settings->modules) && (!in_array('woocommerce',explode(',',$settings->modules)))){
                $new_modules = $settings->modules.',woocommerce';
            }else{
                $new_modules = 'woocommerce';
            }
            DB::table('general_settings')->where('id',1)->update(['modules'=>$new_modules]);

            return redirect()->back()->with('message', 'Woocommerce addon installed successfully!');
        }
        else
            return redirect()->back()->with('not_permitted', 'Wrong purchase code!');
    }

    public function ecommerceInstall(Request $request)
    {
        if(!env('USER_VERIFIED'))
            return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');
        
        $data = [
            'purchase_code' => $request->purchase_code,
            'product' => 50317028
        ];

        $url = 'https://lion-coders.com/addon-install/';
            
        $ch = curl_init(); // Initialize cURL

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_POSTREDIR, 3);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 3);

        $response = curl_exec($ch);

        curl_close($ch);

        if($response != 0) {
            $remote_file_path = $response;
            $remote_file_name = basename($remote_file_path);
            $local_file_path = base_path('/Modules/'.$remote_file_name);
            $copy = copy($remote_file_path, $local_file_path);
            if ($copy) {
                // ****** Unzip ********
                $zip = new ZipArchive;
                $file = $local_file_path;
                $res = $zip->open($file);
                if ($res === TRUE) {
                    $zip->extractTo(base_path('/Modules/'));
                    $zip->close();
                    // ****** Delete Zip File ******
                    File::delete($file);
                }

                $data = [
                    'path' => $response,
                ];

                $url = 'https://lion-coders.com/addon-db/';
            
                $ch = curl_init(); // Initialize cURL

                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
                curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
                curl_setopt($ch, CURLOPT_POSTREDIR, 3);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 3);

                $res = curl_exec($ch);

                curl_close($ch);

                \Artisan::call('migrate');
            }
            $settings = DB::table('general_settings')->select('id','modules')->first();
            if(isset($settings->modules) && (!in_array('ecommerce',explode(',',$settings->modules)))){
                $new_modules = $settings->modules.',ecommerce';
            }else{
                $new_modules = 'ecommerce';
            }
            DB::table('general_settings')->where('id',1)->update(['modules'=>$new_modules]);

            $this->categorySlug();
            $this->brandSlug();
            $this->productSlug();

            return redirect()->back()->with('message', 'eCommerce add-on installed successfully!');
        }
        else
            return redirect()->back()->with('not_permitted', 'Wrong purchase code!');
    }

    public function categorySlug()
    {
        $catgories = Category::select('id','name','slug')->get();
        foreach($catgories as $cat){
            $cat->slug = Str::slug($cat->name, '-');
            $cat->save();
        }
    }

    public function brandSlug()
    {
        $brands = Brand::select('id','title','slug')->get();
        foreach($brands as $brand){
            $brand->slug = Str::slug($brand->title, '-');
            $brand->save();
        }
    }

    public function productSlug()
    {
        $path = public_path('images/product/');

        $products = Product::select('id','name','slug')->get();
        foreach($products as $product){
            $product->slug = Str::slug($product->name, '-');
            $product->save();
        }
    }
}