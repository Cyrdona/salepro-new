<?php

namespace Modules\Manufacturing\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Production extends Model
{
    use HasFactory;
    protected $fillable =[

        "reference_no", "user_id", "warehouse_id",  "item", "total_qty", "total_tax", "total_cost", "shipping_cost", "grand_total", "status", "document", "note", "created_at"
    ];

    public function warehouse()
    {
    	return $this->belongsTo('App\Models\Warehouse');
    }

    public function user()
    {
    	return $this->belongsTo('App\Models\User');
    }

    protected static function newFactory()
    {
        return \Modules\Manufacturing\Database\factories\ProductionFactory::new();
    }
}
