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
            $table->boolean('send_sms')->default(0)->after('is_table');
            
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('pos_setting', function (Blueprint $table) {
            $table->dropColumn('send_sms');
        });
    }
};
