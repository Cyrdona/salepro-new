<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionAlertsTable extends Migration
{
    public function up()
    {
        Schema::create('transaction_alerts', function (Blueprint $table) {
            $table->id();
            $table->text('report_data'); // Données des rapports au format JSON
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('transaction_alerts');
    }
}
