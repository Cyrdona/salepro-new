<?php

namespace App\Contracts\Payble;

interface PaybleContract
{
    public function pay($request, $otherRequest);
    public function cancel();
}
