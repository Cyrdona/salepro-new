<?php

use Database\Seeders\BlogsTableSeeder;
use Database\Seeders\FaqDescriptionsTableSeeder;
use Database\Seeders\FaqsTableSeeder;
use Database\Seeders\FeaturesTableSeeder;
use Database\Seeders\GeneralSettingsTableSeeder;
use Database\Seeders\HeroesTableSeeder;
use Database\Seeders\LanguagesTableSeeder;
use Database\Seeders\ModuleDescriptionsTableSeeder;
use Database\Seeders\ModulesTableSeeder;
use Database\Seeders\PackagesTableSeeder;
use Database\Seeders\PagesTableSeeder;
use Database\Seeders\RolesTableSeeder;
use Database\Seeders\SocialsTableSeeder;
use Database\Seeders\TenantSignupDescriptionsTableSeeder;
use Database\Seeders\TestimonialsTableSeeder;
use Database\Seeders\TicketsTableSeeder;
use Database\Seeders\UsersTableSeeder;
use Database\Seeders\BarcodeSeeder;
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
        if(config('database.connections.saleprosaas_landlord')) {
            $this->call(FeaturesTableSeeder::class);
            $this->call(GeneralSettingsTableSeeder::class);
            $this->call(HeroesTableSeeder::class);
            $this->call(ModulesTableSeeder::class);
            $this->call(ModuleDescriptionsTableSeeder::class);
            $this->call(PackagesTableSeeder::class);
            $this->call(PagesTableSeeder::class);
            $this->call(RolesTableSeeder::class);
            $this->call(SocialsTableSeeder::class);
            $this->call(TenantSignupDescriptionsTableSeeder::class);
            $this->call(TestimonialsTableSeeder::class);
            $this->call(TicketsTableSeeder::class);
            $this->call(UsersTableSeeder::class);
            $this->call(LanguagesTableSeeder::class);
            $this->call(FaqDescriptionsTableSeeder::class);
            $this->call(FaqsTableSeeder::class);
            $this->call(BlogsTableSeeder::class);
        }
        else {
            $this->call(BarcodeSeeder::class);
        }
    }
}
