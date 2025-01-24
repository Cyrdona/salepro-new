<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\TransactionAlertMail;

class TransactionAlert extends Command
{
    protected $signature = 'transaction:alert';
    protected $description = 'Envoyer des alertes par e-mail pour les transactions récentes, supprimées et mises à jour';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        // Date d'aujourd'hui
        $date = Carbon::today()->toDateString();

        // Désactiver temporairement le mode strict
        config()->set('database.connections.mysql.strict', false);
        DB::reconnect();

        // Transactions récentes du jour
        $recentTransactions = DB::table('sales')
            ->leftJoin('billers', 'sales.biller_id', '=', 'billers.id')
            ->whereDate('sales.created_at', $date)
            ->select(
                'sales.id',
                'sales.reference_no',
                'sales.customer_id',
                'sales.grand_total',
                'sales.created_at',
                'billers.name as cashier_name'
            )
            ->get();

        // Transactions mises à jour du jour
        $updatedTransactions = DB::table('sales')
            ->leftJoin('billers', 'sales.biller_id', '=', 'billers.id')
            ->whereDate('sales.updated_at', $date)
            ->whereRaw('sales.updated_at != sales.created_at')
            ->select(
                'sales.id',
                'sales.reference_no',
                'sales.customer_id',
                'sales.grand_total',
                'sales.created_at',
                'sales.updated_at',
                'billers.name as cashier_name'
            )
            ->get();

        // Comparer les anciennes et nouvelles valeurs pour les transactions mises à jour
        $updatedTransactionsDetails = $updatedTransactions->map(function ($transaction) {
            // Récupérer la transaction originale
            $originalTransaction = DB::table('sales')
                ->where('id', $transaction->id)
                ->first();

            // Comparer les champs
            $modifiedFields = [];

            if ($originalTransaction->grand_total !== $transaction->grand_total) {
                $modifiedFields[] = "Grand Total: " . $originalTransaction->grand_total . " -> " . $transaction->grand_total;
            }

            if ($originalTransaction->customer_id !== $transaction->customer_id) {
                $modifiedFields[] = "Customer ID: " . $originalTransaction->customer_id . " -> " . $transaction->customer_id;
            }

            return [
                'transaction' => $transaction,
                'modified_fields' => $modifiedFields
            ];
        });

        // Transactions supprimées (soft deletes)
        $deletedTransactions = DB::table('sales')
            ->leftJoin('billers', 'sales.biller_id', '=', 'billers.id')
            ->whereDate('sales.deleted_at', $date)
            ->select(
                'sales.id',
                'sales.reference_no',
                'sales.customer_id',
                'sales.grand_total',
                'sales.created_at',
                'sales.deleted_at',
                'billers.name as cashier_name'
            )
            ->get();

        // Préparation des données du rapport
        $reportData = [
            'recent_transactions' => $recentTransactions,
            'updated_transactions' => $updatedTransactionsDetails,
            'deleted_transactions' => $deletedTransactions,
        ];

        // Insérer les données dans la table des alertes
        DB::table('transaction_alerts')->insert([
            'report_data' => json_encode($reportData),
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ]);

        // Envoyer un e-mail avec les données du rapport
        Mail::to('bardosafrica@gmail.com')->send(new TransactionAlertMail($reportData));

        // Réactiver le mode strict
        config()->set('database.connections.mysql.strict', true);
        DB::reconnect();

        $this->info('Alerte des transactions envoyée avec succès.');

        return 0;
    }
}
