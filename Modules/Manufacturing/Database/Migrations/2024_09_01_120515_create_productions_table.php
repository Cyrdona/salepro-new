<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('productions', function (Blueprint $table) {
            $table->id();
            $table->string('reference_no');
            $table->integer('warehouse_id');
            $table->integer('user_id');
            $table->integer('item');
            $table->integer('total_qty');
            $table->double('total_tax');
            $table->double('total_cost');
            $table->double('shipping_cost')->nullable();
            $table->double('grand_total');
            $table->integer('status');
            $table->string('document')->nullable();
            $table->text('note')->nullable();
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
        Schema::dropIfExists('productions');
    }
}
