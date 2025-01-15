<?php

namespace App\Mail;

use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class DsrAlertMail extends Mailable
{
    use SerializesModels;

    public $reportData;

    /**
     * Créer une nouvelle instance de la classe.
     *
     * @param  array  $reportData
     * @return void
     */
    public function __construct($reportData)
    {
        $this->reportData = $reportData;
    }

    /**
     * Construire le message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Rapport quotidien des ventes')
                    ->view('backend.mail.dsr_alert'); // Vous pouvez personnaliser cette vue.
    }
}
