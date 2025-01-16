<?php

namespace App\Mail;

use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class DsrAlertMail extends Mailable
{
    public $reportData;

    // Constructeur pour passer les données à la vue
    public function __construct($reportData)
    {
        $this->reportData = $reportData;
    }

    public function build()
    {
        return $this->view('backend.mail.dsr_alert')
                    ->with([
                        'total_sales' => $this->reportData['total_sales'],
                        'total_cash' => $this->reportData['total_cash'],
                        'total_expenses' => $this->reportData['total_expenses'],
                        'created_products' => $this->reportData['created_products'],
                        'updated_products' => $this->reportData['updated_products'],
                    ]);
    }
}
