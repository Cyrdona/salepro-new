<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductProductionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_productions', function (Blueprint $table) {
            $table->id();
            $table->integer('production_id');
            $table->integer('product_id');
            $table->double('qty');
            $table->double('recieved');
            $table->integer('purchase_unit_id');
            $table->double('net_unit_cost');
            $table->double('tax_rate');
            $table->double('tax');
            $table->double('total');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product_productions');
    }
}
