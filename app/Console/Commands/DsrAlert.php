<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\DsrAlertMail;

class DsrAlert extends Command
{
    protected $signature = 'dsralert:send';
    protected $description = 'Envoyer un rapport quotidien des ventes, paiements en espèces, dépenses totales et montant total des ventes';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        // Calculer la date d'aujourd'hui
        $date = Carbon::today()->toDateString();

        // Désactiver temporairement le mode strict pour la requête
        config()->set('database.connections.mysql.strict', false);
        DB::reconnect();

        // Récupérer les ventes du jour
        $sales = DB::table('sales')
            ->whereDate('created_at', $date)
            ->select(DB::raw('SUM(grand_total) as total_sales'))
            ->first();

        // Récupérer les paiements en espèces
        $cashPayments = DB::table('payments')
            ->whereDate('created_at', $date)
            ->where('paying_method', 'cash')
            ->select(DB::raw('SUM(amount) as total_cash'))
            ->first();

        // Récupérer les dépenses totales
        $expenses = DB::table('expenses')
            ->whereDate('created_at', $date)
            ->select(DB::raw('SUM(amount) as total_expenses'))
            ->first();

        $totalSalesAmount = $sales->total_sales ?? 0;
        $totalCashAmount = $cashPayments->total_cash ?? 0;
        $totalExpensesAmount = $expenses->total_expenses ?? 0;

        // Récupérer les produits supprimés et mis à jour
        $deletedProducts = DB::table('products')
            ->onlyTrashed()
            ->whereDate('deleted_at', $date)
            ->get();

        $updatedProducts = DB::table('products')
            ->whereDate('updated_at', $date)
            ->get();

        // Créer le rapport
        $reportData = [
            'total_sales' => $totalSalesAmount,
            'total_cash' => $totalCashAmount,
            'total_expenses' => $totalExpensesAmount,
            'deleted_products' => $deletedProducts,
            'updated_products' => $updatedProducts,
        ];

        // Insérer les données dans la table des alertes
        DB::table('dsr_alerts')
            ->insert([
                'report_data' => json_encode($reportData),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]);

        // Envoyer l'e-mail
        Mail::to('bardosafrica@gmail.com')
            ->send(new DsrAlertMail($reportData));

        // Réactiver le mode strict
        config()->set('database.connections.mysql.strict', true);
        DB::reconnect();

        return 0;
    }
}
