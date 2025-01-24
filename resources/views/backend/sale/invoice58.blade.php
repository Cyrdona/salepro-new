<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/png" href="{{url('logo', $general_setting->site_logo)}}" />
    <title>{{$general_setting->site_title}}</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <style type="text/css">
        * {
            font-size: 10px;
            line-height: 20px;
            font-family: 'Ubuntu', sans-serif;
            text-transform: capitalize;
        }
        .btn {
            padding: 7px 10px;
            text-decoration: none;
            border: none;
            display: block;
            text-align: center;
            margin: 7px;
            cursor:pointer;
        }

        .btn-info {
            background-color: #999;
            color: #FFF;
        }

        .btn-primary {
            background-color: #6449e7;
            color: #FFF;
            width: 100%;
        }
        td,
        th,
        tr,
        table {
            border-collapse: collapse;
        }
        tr {border-bottom: 1px dotted #ddd;}
        td,th {padding: 7px 0;width: 50%;}

        table {width: 100%;}
        tfoot tr th:first-child {text-align: left;}

        .centered {
            text-align: center;
            align-content: center;
        }
        small{font-size:10px;}

        @media print {
            * {
                font-size:10px!important;
                line-height: 20px;
            }
            table {width: 100%;margin: 0 0;}
            td,th {padding: 5px 0;}
            .hidden-print {
                display: none !important;
            }
            /*tbody::after {
                content: ''; display: block;
                page-break-after: always;
                page-break-inside: avoid;
                page-break-before: avoid;
            }*/
        }
    </style>
  </head>
<body>

    <div style="width:100%;max-width:180px;margin:0 0">
        @if(preg_match('~[0-9]~', url()->previous()))
            @php $url = '../../pos'; @endphp
        @else
            @php $url = url()->previous(); @endphp
        @endif
        <div class="hidden-print">
            <table>
                <tr>
                    <td><a href="{{$url}}" class="btn btn-info"><i class="fa fa-arrow-left"></i> {{trans('file.Back')}}</a> </td>
                    <td><button onclick="window.print();" class="btn btn-primary"><i class="dripicons-print"></i> {{trans('file.Print')}}</button></td>
                </tr>
            </table>
            <br>
        </div>

        <div id="receipt-data" style="margin-right:15%">
            <div class="centered">
                @if($general_setting->site_logo)
                    <img src="{{url('logo', $general_setting->site_logo)}}" style="max-width:130px;margin:10px auto 0;">
                @endif

                <!--<h2>{{$lims_biller_data->company_name}}</h2>-->

                <p>{{trans('file.Address')}}: {{$lims_warehouse_data->address}}
                    <br>{{trans('file.Phone Number')}}: {{$lims_warehouse_data->phone}}
                    @if($general_setting->vat_registration_number)
                    <br>{{trans('file.VAT Number')}}: {{$general_setting->vat_registration_number}}
                    @endif
                </p>
            </div>
            <p>{{trans('file.Date')}}: {{date($general_setting->date_format, strtotime($lims_sale_data->created_at->toDateString()))}}<br>
                {{trans('file.reference')}}: {{$lims_sale_data->reference_no}}<br>
                {{trans('file.customer')}}: {{$lims_customer_data->name}}
                @if($lims_sale_data->table_id)
                <br>{{trans('file.Table')}}: {{$lims_sale_data->table->name}}
                <br>{{trans('file.Queue')}}: {{$lims_sale_data->queue}}
                @endif
                <?php
                    foreach($sale_custom_fields as $key => $fieldName) {
                        $field_name = str_replace(" ", "_", strtolower($fieldName));
                        echo '<br>'.$fieldName.': ' . $lims_sale_data->$field_name;
                    }
                    foreach($customer_custom_fields as $key => $fieldName) {
                        $field_name = str_replace(" ", "_", strtolower($fieldName));
                        echo '<br>'.$fieldName.': ' . $lims_customer_data->$field_name;
                    }
                ?>

            </p>
            <table class="table-data" style="width:100%;max-width:180px;margin: 0 0">
                <tbody>
                    <?php $total_product_tax = 0;?>
                    @foreach($lims_product_sale_data as $key => $product_sale_data)
                    <?php
                        $lims_product_data = \App\Models\Product::find($product_sale_data->product_id);
                        if($product_sale_data->variant_id) {
                            $variant_data = \App\Models\Variant::find($product_sale_data->variant_id);
                            $product_name = $lims_product_data->name.' ['.$variant_data->name.']';
                        }
                        elseif($product_sale_data->product_batch_id) {
                            $product_batch_data = \App\Models\ProductBatch::select('batch_no')->find($product_sale_data->product_batch_id);
                            $product_name = $lims_product_data->name.' ['.trans("file.Batch No").':'.$product_batch_data->batch_no.']';
                        }
                        else
                            $product_name = $lims_product_data->name;

                        if($product_sale_data->imei_number && !str_contains($product_sale_data->imei_number, "null") ) {
                            $product_name .= '<br>'.trans('IMEI or Serial Numbers').': '.$product_sale_data->imei_number;
                        }

                        $topping_names = [];
                        $topping_prices = [];
                        $topping_price_sum = 0;
                
                        if ($product_sale_data->topping_id) {
                            $decoded_topping_id = json_decode(json_decode($product_sale_data->topping_id), true);
                            //dd(json_decode($product_sale_data->topping_id));
                            if (is_array($decoded_topping_id)) {
                                foreach ($decoded_topping_id as $topping) {
                                    $topping_names[] = $topping['name']; // Extract name
                                    $topping_prices[] = $topping['price']; // Extract price
                                    $topping_price_sum += $topping['price']; // Sum up prices
                                }
                            }
                        }
                
                        $net_price_with_toppings = $product_sale_data->net_unit_price + $topping_price_sum;
                        $subtotal = ($product_sale_data->total+ $topping_price_sum);
                    ?>
                    <tr>
                        <td colspan="2" style="width:60%">
                            {!!$product_name!!}

                            @if(!empty($topping_names))
                                <br><small>({{ implode(', ', $topping_names) }})</small>
                            @endif

                            @foreach($product_custom_fields as $index => $fieldName)
                                <?php $field_name = str_replace(" ", "_", strtolower($fieldName)) ?>
                                @if($lims_product_data->$field_name)
                                    @if(!$index)
                                    <br>{{$fieldName.': '.$lims_product_data->$field_name}}
                                    @else
                                    {{'/'.$fieldName.': '.$lims_product_data->$field_name}}
                                    @endif
                                @endif
                            @endforeach
                            <br>{{$product_sale_data->qty}} x {{number_format((float)($product_sale_data->total / $product_sale_data->qty), $general_setting->decimal, '.', ',')}}

                            @if(!empty($topping_prices))
                                <small>+ {{ implode(' + ', array_map(fn($price) => number_format($price, $general_setting->decimal, '.', ','), $topping_prices)) }}</small>
                            @endif

                            @if($product_sale_data->tax_rate)
                                <?php $total_product_tax += $product_sale_data->tax ?>
                                [{{trans('file.Tax')}} ({{$product_sale_data->tax_rate}}%): {{$product_sale_data->tax}}]
                            @endif
                        </td>
                        <td style="vertical-align:bottom;width:40%">{{number_format($subtotal, $general_setting->decimal, '.', ',')}}</td>
                    </tr>
                    @endforeach

                <!-- <tfoot> -->
                    <tr>
                        <th colspan="2" style="text-align:left;width:60%">{{trans('file.Total')}}</th>
                        <th style="width:40%">{{number_format((float)($lims_sale_data->total_price), $general_setting->decimal, '.', ',')}}</th>
                    </tr>
                    @if($general_setting->invoice_format == 'gst' && $general_setting->state == 1)
                    <tr>
                        <td colspan="2" style="width:60%">IGST</td>
                        <td style="width:40%">{{number_format((float)($total_product_tax), $general_setting->decimal, '.', ',')}}</td>
                    </tr>
                    @elseif($general_setting->invoice_format == 'gst' && $general_setting->state == 2)
                    <tr>
                        <td colspan="2" style="width:60%">>SGST</td>
                        <td style="width:40%">{{number_format((float)($total_product_tax / 2), $general_setting->decimal, '.', ',')}}</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width:60%">>CGST</td>
                        <td style="width:40%">{{number_format((float)($total_product_tax / 2), $general_setting->decimal, '.', ',')}}</td>
                    </tr>
                    @endif
                    @if($lims_sale_data->order_tax)
                    <tr>
                        <th colspan="2" style="text-align:left;width:60%">{{trans('file.Order Tax')}}</th>
                        <th style="width:40%">{{number_format((float)($lims_sale_data->order_tax), $general_setting->decimal, '.', ',')}}</th>
                    </tr>
                    @endif
                    @if($lims_sale_data->order_discount)
                    <tr>
                        <th colspan="2" style="text-align:left;width:60%">{{trans('file.Order Discount')}}</th>
                        <th style="width:40%">{{number_format((float)($lims_sale_data->order_discount), $general_setting->decimal, '.', ',')}}</th>
                    </tr>
                    @endif
                    @if($lims_sale_data->coupon_discount)
                    <tr>
                        <th colspan="2" style="text-align:left;width:60%">{{trans('file.Coupon Discount')}}</th>
                        <th style="width:40%">{{number_format((float)($lims_sale_data->coupon_discount), $general_setting->decimal, '.', ',')}}</th>
                    </tr>
                    @endif
                    @if($lims_sale_data->shipping_cost)
                    <tr>
                        <th colspan="2" style="text-align:left;width:60%">{{trans('file.Shipping Cost')}}</th>
                        <th style="width:40%">{{number_format((float)($lims_sale_data->shipping_cost), $general_setting->decimal, '.', ',')}}</th>
                    </tr>
                    @endif
                    <tr>
                        <th colspan="2" style="text-align:left;width:60%">{{trans('file.grand total')}}</th>
                        <th style="width:40%">{{number_format((float)($lims_sale_data->grand_total), $general_setting->decimal, '.', ',')}}</th>
                    </tr>
                    @if($lims_sale_data->grand_total - $lims_sale_data->paid_amount > 0)
                    <tr>
                        <th colspan="2" style="text-align:left;width:60%">{{trans('file.Due')}}</th>
                        <th style="width:40%">{{number_format((float)($lims_sale_data->grand_total - $lims_sale_data->paid_amount) ,$general_setting->decimal, '.', ',')}}</th>
                    </tr>
                    @endif
                    @if($totalDue)
                    <tr>
                        <th colspan="2" style="text-align:left;width:60%">{{trans('file.Total Due')}}</th>
                        <th style="width:40%">{{number_format($totalDue, $general_setting->decimal, '.', ',')}}</th>
                    </tr>
                    @endif
                    <tr>
                        @if($general_setting->currency_position == 'prefix')
                        <th class="centered" colspan="3">{{trans('file.In Words')}}: <span>{{$currency_code}}</span> <span>{{str_replace("-"," ",$numberInWords)}}</span></th>
                        @else
                        <th class="centered" colspan="3">{{trans('file.In Words')}}: <span>{{str_replace("-"," ",$numberInWords)}}</span> <span>{{$currency_code}}</span></th>
                        @endif
                    </tr>
                    @foreach($lims_payment_data as $payment_data)
                    <tr style="background-color:#ddd;">
                        <td style="text-align:center;padding: 5px;width:30">{{trans('file.Paid By')}}:<br> {{$payment_data->paying_method}}</td>
                        <td style="text-align:center;padding: 5px;width:30%">{{trans('file.Amount')}}:<br> {{number_format((float)($payment_data->amount), $general_setting->decimal, '.', ',')}}</td>
                        <td style="text-align:center;padding: 5px;width:30%">{{trans('file.Change')}}:<br> {{number_format((float)$payment_data->change, $general_setting->decimal, '.', ',')}}</td>
                    </tr>
                    @endforeach
                    <tr><td class="centered" colspan="3" style="width:100%;">Thank you for shopping with us. <br>Please come again</td></tr>

                    <tr>

                        <td class="centered" colspan="3">
                        <?php echo '<img style="margin:10px auto;" src="data:image/png;base64,' . DNS1D::getBarcodePNG($lims_sale_data->reference_no, 'C128') . '" width="90%" alt="barcode"   />';?>
                        </td>
                    </tr>

                    <tr>
                        <td class="centered" colspan="3">
                        <?php echo '<img style="margin:10px auto;width:30px" src="data:image/png;base64,' . DNS2D::getBarcodePNG($qrText, 'QRCODE') . '" alt="QRcode"   />';?>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <script type="text/javascript">
        localStorage.clear();
        function auto_print() {
            window.print();
        }
        //setTimeout(auto_print, 1000);
    </script>

</body>
</html>
