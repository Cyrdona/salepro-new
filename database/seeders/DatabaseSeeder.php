<?php

use Database\Seeders\BarcodeSeeder;
use Database\Seeders\ExternalServicesSeeder;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(BarcodeSeeder::class);
        $this->call(ExternalServicesSeeder::class);
    }
}
