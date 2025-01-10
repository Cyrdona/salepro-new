<?php

use Modules\Manufacturing\Http\Controllers\ProductionController;
use Stancl\Tenancy\Middleware\InitializeTenancyByDomain;
use Stancl\Tenancy\Middleware\PreventAccessFromCentralDomains;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

if(config('database.connections.saleprosaas_landlord')) {
    Route::middleware(['common', 'auth', 'active', InitializeTenancyByDomain::class,PreventAccessFromCentralDomains::class])->group(function () {
        //production routes
        Route::controller(ProductionController::class)->group(function () {
            Route::prefix('productions')->group(function () {
                Route::post('production-data', 'productionData')->name('productions.data');
                Route::get('product_production/{id}', 'productProductionData');
            });
        });
        Route::resource('productions',ProductionController::class)->except([ 'show']);

        Route::prefix('manufacturing')->group(function() {
            Route::get('/', 'ManufacturingController@index');
        });
    });
}
else {
    Route::middleware(['common', 'auth', 'active'])->group(function () {
        //production routes
        Route::controller(ProductionController::class)->group(function () {
            Route::prefix('productions')->group(function () {
                Route::post('production-data', 'productionData')->name('productions.data');
                Route::get('product_production/{id}', 'productProductionData');
            });
        });
        Route::resource('productions',ProductionController::class)->except([ 'show']);

        Route::prefix('manufacturing')->group(function() {
            Route::get('/', 'ManufacturingController@index');
        });
    });
}







