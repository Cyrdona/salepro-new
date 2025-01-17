<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class TransactionAlertMail extends Mailable
{
    use Queueable, SerializesModels;

    public $reportData;

    public function __construct($reportData)
    {
        $this->reportData = $reportData;
    }

    public function build()
    {
        return $this->subject('Rapport des Transactions Récentes')
                    ->view('backend.mail.transaction_alert')
                    ->with('reportData', $this->reportData);
    }
}
