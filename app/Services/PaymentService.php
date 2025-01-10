<?php

namespace App\Services;

use App\Payment\BkashPayment;
use App\Payment\PaypalPayment;
use App\Payment\RazorpayPayment;
use App\Payment\StripePayment;
use App\Payment\PaystackPayment;
use App\Payment\PaydunyaPayment;
use App\Payment\SslCommerz;

class PaymentService
{
    public function initialize($payment_type)
    {
        switch ($payment_type) {
            case 'stripe':
                return new StripePayment();
            case 'paypal':
                return new PaypalPayment();
            case 'razorpay':
                return new RazorpayPayment();
            case 'paystack':
                return new PaystackPayment();
            case 'paydunya':
                return new PaydunyaPayment();
            case 'bkash':
                return new BkashPayment();
            case 'ssl_commerz':
                return new SslCommerz();
            default:
                break;
        }
    }
}
?>
