<?php
namespace App\ViewModels;

use App\Models\Customer;
use App\Models\ExternalService;
use App\Models\SmsTemplate;
use App\Services\SmsService;

class SmsModel implements ISmsModel
{
    private $_smsService;

    public function __construct(SmsService $smsService)
    {
        $this->_smsService = $smsService;
    }

    public function initialize($data)
    {
         # check sale sataus
         if( $data['sale_status'] == '1')
            $data['sale_status'] = 'completed';
        if( $data['sale_status'] == '2')
            $data['sale_status'] = 'pending';
        if( $data['sale_status'] == '3')
            $data['sale_status'] = 'draft';
        if( $data['sale_status'] == '4')
            $data['sale_status'] = 'returned';

        # check payment status
        if( $data['payment_status'] == '1')
            $data['payment_status'] = 'pending';
        if( $data['payment_status'] == '2')
            $data['payment_status'] = 'due';
        if( $data['payment_status'] == '3')
            $data['payment_status'] = 'partial';
        if( $data['payment_status'] == '4')
            $data['payment_status'] = 'paid';
        
        $smsData = $this->processSmsData($data['type'], $data['template_id'], $data['customer_id'], $data['reference_no'], $data['sale_status'], $data['payment_status']);

        $this->_smsService->initialize($smsData);
    }

    public function processSmsData($type, $templateId, $customerData, $referenceNo, $saleStatus, $paymentStatus)
    {
        $smsData = [];

        $smsTemplate = SmsTemplate::find($templateId);
        $template = $smsTemplate['content'];
        
        if($type == 'onsite')
        {
            $customer = Customer::find($customerData);
            $customerName = $customer['name'];
            $smsData['recipent'] = $customer['phone_number'];
        }
        
        if($type == 'online')
        {
            $customerName = $customerData['billing_name'];
            $smsData['recipent'] = $customerData['billing_phone'];
        }

        $smsData['message'] = $this->replacePlaceholders($template, $customerName, $referenceNo, $saleStatus, $paymentStatus);
       
        $smsProvider = ExternalService::where('active',true)->where('type','sms')->first();
        $smsData['sms_provider_name'] = $smsProvider->name;
        $smsData['details'] = $smsProvider->details;
       
        return $smsData;
    }

    public function replacePlaceholders($template, $customerName, $referenceNo, $saleStatus, $paymentStatus) {
        // Check for the presence of the [customer] placeholder in the template
        if (strpos($template, '[customer]') !== false) {
            // Replace [customer] with the value of $customerName
            $template = str_replace('[customer]', $customerName, $template);
        }
    
        // Check for the presence of the [reference] placeholder in the template
        if (strpos($template, '[reference]') !== false) {
            // Replace [reference] with the value of $referenceNo
            $template = str_replace('[reference]', $referenceNo, $template);
        }

        // Check for the presence of the [sale_status] placeholder in the template
        if (strpos($template, '[sale_status]') !== false) {
            // Replace [reference] with the value of $referenceNo
            $template = str_replace('[sale_status]', $saleStatus, $template);
        }

         // Check for the presence of the [payment_status] placeholder in the template
         if (strpos($template, '[payment_status]') !== false) {
            // Replace [reference] with the value of $referenceNo
            $template = str_replace('[payment_status]', $paymentStatus, $template);
        }
    
        // Return the modified template with the placeholders replaced (if found)
        return $template;
    }
}