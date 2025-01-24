<?php

namespace Database\Seeders\Tenant;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ExternalServicesSeeder extends Seeder
{
    public function run()
    {
        $newAddons = ['ecommerce']; // Future add-ons

        // Fetch all rows
        $gateways = DB::table('external_services')->get();

        foreach ($gateways as $gateway) {
            // Decode existing module_status, or initialize as empty
            $moduleStatus = json_decode($gateway->module_status, true) ?? [];

            // Remove 'salepro' from module_status for all rows
            //unset($moduleStatus['salepro']);

            // Ensure all add-ons are present in module_status with a default of false
            foreach ($newAddons as $addon) {
                if (!isset($moduleStatus[$addon])) {
                    $moduleStatus[$addon] = false;
                }
            }

            // Update the row
            DB::table('external_services')
                ->where('id', $gateway->id)
                ->update(['module_status' => json_encode($moduleStatus)]);
        }

        // Add a new gateway if needed
        $newGateway = DB::table('external_services')
            ->where('name', 'PayPal') // Replace with the actual name
            ->first();

        if (!$newGateway) {
            DB::table('external_services')->insert([
                'name' => 'PayPal',
                'type' => 'payment',
                'details' => 'Client ID,Client Secret;abcd1234,wxyz5678', // Dummy values; users will update
                'module_status' => json_encode(['ecommerce' => true, 'salepro' => true]),
                'active' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Add a new gateway if needed
        $newGateway = DB::table('external_services')
            ->where('name', 'Stripe') // Replace with the actual name
            ->first();

        if (!$newGateway) {
            DB::table('external_services')->insert([
                'name' => 'Stripe',
                'type' => 'payment',
                'details' => 'Public Key,Private Key;efgh1234,stuv5678', // Dummy values; users will update
                'module_status' => json_encode(['ecommerce' => true, 'salepro' => true]),
                'active' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Add a new gateway if needed
        $newGateway = DB::table('external_services')
            ->where('name', 'Razorpay') // Replace with the actual name
            ->first();

        if (!$newGateway) {
            DB::table('external_services')->insert([
                'name' => 'Razorpay',
                'type' => 'payment',
                'details' => 'Key,Secret;rzp_test_Y4MCcpHfZNU6rR,3Hr7SDqaZ0G5waN0jsLgsiLx', // Dummy values; users will update
                'module_status' => json_encode(['ecommerce' => true, 'salepro' => true]),
                'active' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Add a new gateway if needed
        $newGateway = DB::table('external_services')
            ->where('name', 'Paystack') // Replace with the actual name
            ->first();

        if (!$newGateway) {
            DB::table('external_services')->insert([
                'name' => 'Paystack',
                'type' => 'payment',
                'details' => 'public_Key,Secret_Key;pk_test_e8d220b7463d64569f0053e78534f38e6b10cf4a,sk_test_6d62cb976e1e0ab43f1e48b2934b0dfc7f32a1fe', // Dummy values; users will update
                'module_status' => json_encode(['ecommerce' => true, 'salepro' => true]),
                'active' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Add a new gateway if needed
        $newGateway = DB::table('external_services')
            ->where('name', 'Mollie') // Replace with the actual name
            ->first();

        if (!$newGateway) {
            DB::table('external_services')->insert([
                'name' => 'Mollie',
                'type' => 'payment',
                'details' => 'api_key;test_dHar4XY7LxsDOtmnkVtjNVWXLSlXsM', // Dummy values; users will update
                'module_status' => json_encode(['ecommerce' => true, 'salepro' => true]),
                'active' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Add a new gateway if needed
        $newGateway = DB::table('external_services')
            ->where('name', 'Xendit') // Replace with the actual name
            ->first();

        if (!$newGateway) {
            DB::table('external_services')->insert([
                'name' => 'Xendit',
                'type' => 'payment',
                'details' => 'secret_key,callback_token;xnd_development_aKJVKYbc4lHkEjcCLzWLrBsKs6jF6nbM6WaCMfnJerP3JW57CLis553XNRdDU,YPZxND92Mt8tdXntTYIEkRX802onZ5OcdKBUzycebuqYvN4n', // Dummy values; users will update
                'module_status' => json_encode(['ecommerce' => true, 'salepro' => true]),
                'active' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Add a new gateway if needed
        $newGateway = DB::table('external_services')
            ->where('name', 'bkash') // Replace with the actual name
            ->first();

        if (!$newGateway) {
            DB::table('external_services')->insert([
                'name' => 'bkash',
                'type' => 'payment',
                'details' => 'Mode,app_key,app_secret,username,password;sandbox,0vWQuCRGiUX7EPVjQDr0EUAYtc,jcUNPBgbcqEDedNKdvE4G1cAK7D3hCjmJccNPZZBq96QIxxwAMEx,01770618567,D7DaC<*E*eG', // Dummy values; users will update
                'module_status' => json_encode(['ecommerce' => true, 'salepro' => true]),
                'active' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Add a new gateway if needed
        $newGateway = DB::table('external_services')
            ->where('name', 'sslcommerz') // Replace with the actual name
            ->first();

        if (!$newGateway) {
            DB::table('external_services')->insert([
                'name' => 'sslcommerz',
                'type' => 'payment',
                'details' => 'appkey,appsecret;12341234,asdfa23423', // Dummy values; users will update
                'module_status' => json_encode(['ecommerce' => true, 'salepro' => true]),
                'active' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Add a new gateway if needed
        $newGateway = DB::table('external_services')
            ->where('name', 'Mpesa') // Replace with the actual name
            ->first();

        if (!$newGateway) {
            DB::table('external_services')->insert([
                'name' => 'Mpesa',
                'type' => 'payment',
                'details' => 'consumer_Key,consumer_Secret;fhfgkj,dtrddhd', // Dummy values; users will update
                'module_status' => json_encode(['ecommerce' => true, 'salepro' => true]),
                'active' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Add a new gateway if needed
        $newGateway = DB::table('external_services')
            ->where('name', 'Pesapal') // Replace with the actual name
            ->first();

        if (!$newGateway) {
            DB::table('external_services')->insert([
                'name' => 'Pesapal',
                'type' => 'payment',
                'details' => 'Mode,Consumer Key,Consumer Secret;sandbox,qkio1BGGYAXTu2JOfm7XSXNruoZsrqEW,osGQ364R49cXKeOYSpaOnT++rHs=', // Dummy values; users will update
                'module_status' => json_encode(['ecommerce' => true, 'salepro' => true]),
                'active' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        // Add a new gateway if needed
        $newGateway = DB::table('external_services')
            ->where('name', 'Moneipoint') // Replace with the actual name
            ->first();

        if (!$newGateway) {
            DB::table('external_services')->insert([
                'name' => 'Moneipoint',
                'type' => 'payment',
                'details' => 'Mode,client_id,client_secret,terminal_serial;sandbox,api-client-3956952-7e1279e2-95d2-45e1-825a-3a28e0a35168,ZtH02Q%jQ$Imcf%W^B%q,C42P008D01909830', // Dummy values; users will update
                'module_status' => json_encode(['ecommerce' => true, 'salepro' => true]),
                'active' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
