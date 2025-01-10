<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::statement('TRUNCATE TABLE attendances');
        Schema::table('attendances', function (Blueprint $table) {
            $table->date('date')->after('id');
            $table->integer('employee_id')->after('date');
            $table->string('checkin')->after('user_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
