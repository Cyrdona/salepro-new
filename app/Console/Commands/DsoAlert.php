<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\DsoAlertMail;  // Ensure to create this mail class

class DsoAlert extends Command
{
    /**
     * Le nom et la signature de la commande.
     *
     * @var string
     */
    protected $signature = 'dsoalert:find';

    /**
     * La description de la commande.
     *
     * @var string
     */
    protected $description = 'Trouver tous les produits qui n\'ont pas atteint l\'objectif de vente quotidien';

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
        // Calculer la date d'hier
        $date = date("Y-m-d", strtotime("-1 jour"));

        // Désactiver temporairement le mode strict pour la requête
        config()->set('database.connections.mysql.strict', false);
        DB::reconnect();

        // Récupérer les produits qui n'ont pas atteint les objectifs de vente quotidiens
        $lims_dso_alert_products = DB::table('products')
            ->leftJoin('product_sales', function($join) {
                $join->on('products.id', '=', 'product_sales.product_id')
                     ->whereNotNull('products.daily_sale_objective');
            })
            ->where('products.daily_sale_objective', '>', function($query) {
                $query->select(DB::raw("sum(product_sales.qty)"))
                      ->from('product_sales');
            })
            ->whereDate('product_sales.created_at', $date)
            ->select('products.name', 'products.code')
            ->groupBy('products.id')  // S'assurer de regrouper par ID du produit
            ->get();

        // Réactiver le mode strict
        config()->set('database.connections.mysql.strict', true);
        DB::reconnect();

        // Compter le nombre de produits qui n'ont pas atteint l'objectif
        $number_of_products = count($lims_dso_alert_products);

        // Afficher les produits pour le débogage (optionnel)
        if ($number_of_products) {
            echo json_encode($lims_dso_alert_products, JSON_PRETTY_PRINT);
        }

        // Insérer les données dans la table dso_alerts
        if ($number_of_products) {
            DB::table('dso_alerts')
                ->insert([
                    'product_info' => json_encode($lims_dso_alert_products),  // Sérialiser les données
                    'number_of_products' => $number_of_products,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now()
                ]);

            // Envoyer une notification par email via Gmail
            Mail::to('bardosafrica@gmail.com')  // Remplacez par votre adresse email
                ->send(new DsoAlertMail($lims_dso_alert_products, $number_of_products)); // Assurez-vous d'avoir créé ce Mailable
        }

        return 0;
    }
}
