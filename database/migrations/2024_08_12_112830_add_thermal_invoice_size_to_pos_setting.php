<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('pos_setting', function (Blueprint $table) {
            $table->string('thermal_invoice_size')->default('80')->after('invoice_option');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('pos_setting', function (Blueprint $table) {
            $table->dropColumn('thermal_invoice_size');
        });
    }
};
