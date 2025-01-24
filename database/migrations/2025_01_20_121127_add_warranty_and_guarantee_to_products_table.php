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
        Schema::table('products', function (Blueprint $table) {
            $table->integer('guarantee')->nullable()->after('is_active');
            $table->integer('warranty')->nullable()->after('guarantee');
            $table->string('guarantee_type')->nullable()->after('warranty');
            $table->string('warranty_type')->nullable()->after('guarantee_type');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropColumn('guarantee');
            $table->dropColumn('warranty');
            $table->dropColumn('guarantee_type');
            $table->dropColumn('warranty_type');
            
        });
    }
};
