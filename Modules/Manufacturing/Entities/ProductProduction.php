<?php

namespace Modules\Manufacturing\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ProductProduction extends Model
{
    use HasFactory;
    protected $fillable =[

        "production_id", "product_id", "qty", "recieved", "purchase_unit_id", "net_unit_cost", "tax_rate", "tax", "total"
    ];

    protected static function newFactory()
    {
        return \Modules\Manufacturing\Database\factories\ProductProductionFactory::new();
    }
}
