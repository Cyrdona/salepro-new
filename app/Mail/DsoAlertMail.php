<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class DsoAlertMail extends Mailable
{
    use SerializesModels;

    public $products;
    public $number_of_products;

    /**
     * Créer une nouvelle instance du mailable.
     *
     * @return void
     */
    public function __construct($products, $number_of_products)
    {
        $this->products = $products;
        $this->number_of_products = $number_of_products;
    }

    /**
     * Construire le message de l'email.
     *
     * @return \Illuminate\Mail\Mailable
     */
    public function build()
    {
        return $this->subject('Alerte Objectif de Vente Quotidien Non Atteint')
                    ->view('backend.mail.dso_alert');  // Assurez-vous de créer cette vue
    }
}
