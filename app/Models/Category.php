<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable =[

        "name", 'image', "parent_id", "is_active", "is_sync_disable", "woocommerce_category_id","slug","featured","page_title","short_description"
    ];

    public function product()
    {
    	return $this->hasMany('App\Models\Product');
    }
}
