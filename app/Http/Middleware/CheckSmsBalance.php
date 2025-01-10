<?php

namespace App\Http\Middleware;

use App\SMSProviders\TonkraSms;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckSmsBalance
{
    protected $smsBalanceChecker;
    public function __construct(TonkraSms $tonkraSms)
    {
        return $this->smsBalanceChecker = $tonkraSms;
    }
    public function handle(Request $request, Closure $next): Response
    {
        $smsBalance = $this->smsBalanceChecker->balance();
        
        if ($smsBalance <= 0) {
            session()->flash('error', 'SMS balance is zero. You cannot proceed with the sale.');
        }

        return $next($request);
        

        // // Redirect to the desired route (e.g., POS screen or dashboard)
        // return redirect()->back();
    }
}
