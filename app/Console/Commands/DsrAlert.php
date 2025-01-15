<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\DsrAlertMail; // Assurez-vous de créer cette classe de mail

class DsrAlert extends Command
{
    /**
     * Le nom et la signature de la commande.
     *
     * @var string
     */
    protected $signature = 'dsralert:send';

    /**
     * La description de la commande.
     *
     * @var string
     */
    protected $description = 'Envoyer un rapport quotidien des ventes, paiements en espèces, dépenses totales et montant total des ventes';

    /**
     * Créer une nouvelle instance de la commande.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Exécuter la commande.
     *
     * @return int
     */
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
            ->select(DB::raw('SUM(total_amount) as total_sales'))
            ->first();

        // Récupérer les paiements en espèces
        $cashPayments = DB::table('payments')
            ->whereDate('created_at', $date)
            ->where('payment_method', 'cash')
            ->select(DB::raw('SUM(amount) as total_cash'))
            ->first();

        // Récupérer les dépenses totales
        $expenses = DB::table('expenses')
            ->whereDate('created_at', $date)
            ->select(DB::raw('SUM(amount) as total_expenses'))
            ->first();

        // Calculer le montant total des ventes
        $totalSalesAmount = $sales->total_sales ?? 0;
        $totalCashAmount = $cashPayments->total_cash ?? 0;
        $totalExpenses = $expenses->total_expenses ?? 0;

        // Récupérer les produits supprimés
        $deletedProducts = DB::table('products')
            ->onlyTrashed()
            ->whereDate('deleted_at', $date)
            ->get();

        // Récupérer les produits mis à jour
        $updatedProducts = DB::table('products')
            ->whereDate('updated_at', $date)
            ->get();

        // Créer le rapport
        $reportData = [
            'total_sales' => $totalSalesAmount,
            'total_cash' => $totalCashAmount,
            'total_expenses' => $totalExpenses,
            'deleted_products' => $deletedProducts,
            'updated_products' => $updatedProducts,
        ];

        // Insérer les données dans la table des alertes
        DB::table('dsr_alerts')
            ->insert([
                'report_data' => json_encode($reportData),  // Sérialiser les données
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]);

        // Envoyer un e-mail de notification avec les données du rapport
        Mail::to('bardosafrica@gmail.com')  // Remplacez par votre adresse e-mail
            ->send(new DsrAlertMail($reportData)); // Assurez-vous d'avoir créé ce Mailable

        // Réactiver le mode strict
        config()->set('database.connections.mysql.strict', true);
        DB::reconnect();

        return 0;
    }
}
