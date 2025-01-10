<?php

namespace App\Contracts\Sms;

interface SendSmsInterface
{
    public function send($data);
}