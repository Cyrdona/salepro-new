<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="{{url('logo', $general_setting->site_logo)}}" />
        <title>{{$lims_sale_data->customer->name.'_Sale_'.$lims_sale_data->reference_no}}</title>
        <style type="text/css">
            span,td {
                font-size: 13px;
                line-height: 1.4;
            }
            @media print {
                .hidden-print {
                    display: none !important;
                }
                tr.table-header {
                    background-color:rgb(1, 75, 148) !important;
                    -webkit-print-color-adjust: exact;
                }
                td.td-text {
                    background-color:rgb(205, 218, 235) !important;
                    -webkit-print-color-adjust: exact;
                }
            }
            table,tr,td {font-family: sans-serif;border-collapse: collapse;}
        </style>
    </head>
    <body>
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
        <table style="width: 100%;border-collapse: collapse;">
            <tr>
                <td colspan="2" style="padding:9px 0;width:40%">
                    <h1 style="margin:0">{{$lims_biller_data->company_name}}</h1>
                    <div>
                        <span>Address:</span>&nbsp;&nbsp;<span>{{$lims_warehouse_data->address}}</span>
                    </div>
                    <div>
                        <span>Phone:</span>&nbsp;&nbsp;<span>{{$lims_warehouse_data->phone}}</span>
                    </div>
                    @if($general_setting->vat_registration_number)
                    <div>
                        <span>{{trans('file.VAT Number')}}:</span>&nbsp;&nbsp;<span>{{$general_setting->vat_registration_number}}</span>
                    </div>
                    @endif
                    <?php
                        foreach($sale_custom_fields as $key => $fieldName) {
                            $field_name = str_replace(" ", "_", strtolower($fieldName));
                            echo '<div><span>'.$fieldName.':hello ' . $lims_sale_data->$field_name.'</span></div>';
                        }
                        foreach($customer_custom_fields as $key => $fieldName) {
                            $field_name = str_replace(" ", "_", strtolower($fieldName));
                            echo '<div><span>'.$fieldName.': ' . $lims_customer_data->$field_name.'</span></div>';
                        }
                    ?>
                </td>
                <td style="width:30%; text-align: middle; vertical-align: top;">
                    <img src="{{url('logo', $general_setting->site_logo)}}" height="80" width="120">
                </td>
                <td style="padding:5px -19px;width:30%;text-align:right;">
                    <div style="display: flex;justify-content: space-between;border-bottom:1px solid #aaa">
                        <span>Invoice No:</span> <span>{{$lims_sale_data->reference_no}}</span>
                    </div>
                    <div style="display: flex;justify-content: space-between;border-bottom:1px solid #aaa">
                        <span>Date:</span> <span>{{$lims_sale_data->created_at}}</span>
                    </div>
                    @if($paid_by_info)
                        <div style="display: flex;justify-content: space-between;border-bottom:1px solid #aaa">
                            <span>Paid By:</span> <span>{{$paid_by_info}}</span>
                        </div>
                    @endif
                </td>
            </tr>
        </table>
        <table style="width: 100%;border-collapse: collapse; margin-top: 4px;">
            <tr>
                <td colspan="3" style="padding:4px 0;width:30%;vertical-align:top">
                    <h2 style="background-color: rgb(1, 75, 148); color: white; padding:3px 10px; margin-bottom:0">Bill To</h2>
                    <div style="margin-top: 10px;margin-left: 10px">
                        <span>{{$lims_customer_data->name}}</span>
                    </div>
                    <div style="margin-left: 10px">
                        <span>VAT Number:</span>&nbsp;&nbsp;<span>{{$lims_customer_data->tax_no}}</span>
                    </div>
                    <div style="margin-left: 10px">

                        <span>Address:</span>&nbsp;&nbsp;
                        @if($lims_sale_data->sale_type == 'online')
                        <span>{{$lims_sale_data->shipping_name}}, {{$lims_sale_data->shipping_address}}, {{$lims_sale_data->shipping_city}}, {{$lims_sale_data->shipping_country}}, {{$lims_sale_data->shipping_zip}}</span>
                        @else
                        <span>{{$lims_customer_data->address}}</span>
                        @endif
                    </div>
                    @if(isset($lims_customer_data->phone_number) || isset($lims_sale_data->shipping_phone))
                    <div style="margin-bottom: 10px;margin-left: 10px">
                        <span>Phone:</span>&nbsp;&nbsp;
                        @if($lims_sale_data->sale_type == 'online')
                        <span>{{$lims_sale_data->shipping_phone}}
                        @else
                        <span>{{$lims_customer_data->phone_number}}</span>
                        @endif
                    </div>
                    @endif
                </td>
                <td colspan="4" style="width:60%">

                </td>
            </tr>
        </table>
        <table dir="@if( Config::get('app.locale') == 'ar' || $general_setting->is_rtl){{'rtl'}}@endif" style="width: 100%;border-collapse: collapse;">
            <tr class="table-header" style="background-color: rgb(1, 75, 148); color: white;">
                <td style="border:1px solid #222;padding:1px 3px;width:4%;text-align:center">#</td>
                <td style="border:1px solid #222;padding:1px 3px;width:49%;text-align:center">{{trans('file.Description')}}</td>
                <td style="border:1px solid #222;padding:1px 3px;width:6%;text-align:center">{{trans('file.Qty')}}</td>
                <td style="border:1px solid #222;padding:1px 3px;width:9%;text-align:center">{{trans('file.Unit Price')}}</td>
                <td style="border:1px solid #222;padding:1px 3px;width:7%;text-align:center">{{trans('file.Total')}}</td>
                <td style="border:1px solid #222;padding:1px 3px;width:7%;text-align:center">{{trans('file.Tax')}}</td>
                <td style="border:1px solid #222;padding:1px 2px;width:13%;text-align:center;">{{trans('file.Subtotal')}}</td>
            </tr>
            <?php
                $total_product_tax = 0;
                $totalPrice = 0;
            ?>
            
            @foreach($lims_product_sale_data as $key => $product_sale_data)
            <?php
                $lims_product_data = \App\Models\Product::find($product_sale_data->product_id);
                if($product_sale_data->sale_unit_id) {
                    $unit = \App\Models\Unit::select('unit_code')->find($product_sale_data->sale_unit_id);
                    $unit_code = $unit->unit_code;
                }
                else
                    $unit_code = '';

                if($product_sale_data->variant_id) {
                    $variant = \App\Models\Variant::select('name')->find($product_sale_data->variant_id);
                    $variant_name = $variant->name;
                }
                else
                    $variant_name = '';
                $totalPrice += $product_sale_data->net_unit_price * $product_sale_data->qty;

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
                $total = ($product_sale_data->net_unit_price + $topping_price_sum) * $product_sale_data->qty;

                $subtotal = ($product_sale_data->total+ $topping_price_sum);
            ?>
            <tr>
                <td style="@if( Config::get('app.locale') == 'ar' || $general_setting->is_rtl){{'border-right:1px solid #222;'}}@endif border:1px solid #222;padding:1px 3px;text-align: center;">{{$key+1}}</td>
                <td style="border:1px solid #222;padding:1px 3px;font-size: 15px;line-height: 1.2;">

                    <span style="font-weight: bold;">Product Name</span>: 

                    {!!$lims_product_data->name!!}

                    @if(!empty($topping_names))
                        <br><small>({{ implode(', ', $topping_names) }})</small>
                    @endif

                    @foreach($product_custom_fields as $index => $fieldName)
                        <?php $field_name = str_replace(" ", "_", strtolower($fieldName)) ?>
                        @if($lims_product_data->$field_name)
                            @if(!$index)
                            <br>
                            <span style="font-weight: bold;">{{ $fieldName }}</span>
                            {{ ': ' . $lims_product_data->$field_name }}
                            @else
                            <br>
                            <span style="font-weight: bold;">{{ $fieldName }}</span>
                            {{': ' . $lims_product_data->$field_name }}
                            @endif
                        @endif
                    @endforeach
                    @if($product_sale_data->imei_number && !str_contains($product_sale_data->imei_number, "null") )
                    <br>IMEI or Serial: {{$product_sale_data->imei_number}}
                    @endif
                    <!-- warranty -->
                     @if (isset($product_sale_data->warranty_duration))
                            <br>
                            <span style="font-weight: bold;">Warranty</span>{{ ': ' . $product_sale_data->warranty_duration }}
                            <br>
                            <span style="font-weight: bold;">Will Expire</span>{{ ': ' . $product_sale_data->warranty_end }}
                     @endif
                     <!-- guarantee -->
                     @if (isset($product_sale_data->guarantee_duration))
                            <br>
                            <span style="font-weight: bold;">Guarantee</span>{{ ': ' . $product_sale_data->guarantee_duration }}
                            <br>
                            <span style="font-weight: bold;">Will Expire</span>{{ ': ' . $product_sale_data->guarantee_end }}
                     @endif
                </td>
                <td style="border:1px solid #222;padding:1px 3px;text-align:center">{{$product_sale_data->qty.' '.$unit_code.' '.$variant_name}}</td>
                <td style="border:1px solid #222;padding:1px 3px;text-align:center">{{number_format($product_sale_data->net_unit_price, $general_setting->decimal, '.', ',')}}
                @if(!empty($topping_prices))
                    <br><small>+ {{ implode(' + ', array_map(fn($price) => number_format($price, $general_setting->decimal, '.', ','), $topping_prices)) }}</small>
                @endif
                </td>
                <td style="border:1px solid #222;padding:1px 3px;text-align:center">{{ number_format($total, $general_setting->decimal, '.', ',') }}</td>
                <td style="border:1px solid #222;padding:1px 3px;text-align:center">{{number_format($product_sale_data->tax, $general_setting->decimal, '.', ',')}}</td>
                <td style="border:1px solid #222;border-right:1px solid #222;padding:1px 3px;text-align:center;font-size: 15px;">{{number_format($subtotal, $general_setting->decimal, '.', ',')}}</td>
            </tr>
            @endforeach
            <tr>
                <td colspan="3" rowspan="@if($general_setting->invoice_format == 'gst' && $general_setting->state == 2) 5 @else 4 @endif" style="border:1px solid #222;padding:1px 3px;text-align: center; vertical-align: top;">
                    {{trans('file.Note')}}<br>{{$lims_sale_data->sale_note}}
                </td>
                <td class="td-text" colspan="3" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);">
                    {{trans('file.Total Before Tax')}}
                </td>
                <td class="td-text" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);text-align: center;font-size: 15px;">
                        {{number_format((float)($lims_sale_data->total_price - ($lims_sale_data->total_tax+$lims_sale_data->order_tax) ) ,$general_setting->decimal, '.', ',')}}
                </td>
            </tr>
            @if($general_setting->invoice_format == 'gst' && $general_setting->state == 1)
                <tr>
                    <td class="td-text" colspan="3" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);">
                        IGST
                    </td>
                    <td class="td-text" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);text-align: center;font-size: 15px;">
                        {{number_format((float)($lims_sale_data->total_tax+$lims_sale_data->order_tax) ,$general_setting->decimal, '.', ',')}}
                    </td>
                </tr>
            @elseif($general_setting->invoice_format == 'gst' && $general_setting->state == 2)
                <tr>
                    <td class="td-text" colspan="3" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);">
                        SGST
                    </td>
                    <td class="td-text" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);text-align: center;font-size: 15px;">
                        {{number_format( ($lims_sale_data->total_tax+$lims_sale_data->order_tax) / 2 , $general_setting->decimal, '.', ',')}}
                    </td>
                </tr>
                <tr>
                    <td class="td-text" colspan="3" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);">
                        CGST
                    </td>
                    <td class="td-text" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);text-align: center;font-size: 15px;">
                        {{number_format( ($lims_sale_data->total_tax+$lims_sale_data->order_tax) / 2 , $general_setting->decimal, '.', ',')}}
                    </td>
                </tr>
            @else
                <tr>
                    <td class="td-text" colspan="3" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);">
                        {{trans('file.Tax')}}
                    </td>
                    <td class="td-text" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);text-align: center;font-size: 15px;">
                        {{number_format((float)($lims_sale_data->total_tax+$lims_sale_data->order_tax) ,$general_setting->decimal, '.', ',')}}
                    </td>
                </tr>
            @endif
            <tr>
                <td class="td-text" colspan="3" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);">
                    {{trans('file.Discount')}}
                </td>
                <td class="td-text" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);text-align: center;font-size: 15px;">
                    {{number_format((float)($lims_sale_data->total_discount+$lims_sale_data->order_discount) ,$general_setting->decimal, '.', ',')}}
                </td>
            </tr>
            <tr>
                <td class="td-text" colspan="3" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);">{{trans('file.grand total')}}</td>
                <td class="td-text" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);text-align: center;font-size: 15px;">{{number_format((float)$lims_sale_data->grand_total ,$general_setting->decimal, '.', ',')}}</td>
            </tr>
            <tr>
                @if($general_setting->currency_position == 'prefix')
                    <td class="td-text" colspan="3" rowspan="4" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);text-align: center;vertical-align: bottom;font-size: 15px; vertical-align: top;">
                        {{trans('file.In Words')}}<br>{{$currency_code}} <span style="text-transform:capitalize;font-size: 15px;">{{str_replace("-"," ",$numberInWords)}}</span> only
                    </td>
                @else
                    <td class="td-text" colspan="3" rowspan="4" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);text-align: center;vertical-align: bottom;font-size: 15px; vertical-align: top;">
                        {{trans('file.In Words')}}:<br><span style="text-transform:capitalize;font-size: 15px;">{{str_replace("-"," ",$numberInWords)}}</span> {{$currency_code}} only
                    </td>
                @endif
            </tr>
            <tr>
                <td class="td-text" colspan="3" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);">
                    {{trans('file.Paid')}}
                </td>
                <td class="td-text" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);text-align: center;font-size: 15px;">
                    {{number_format((float)$lims_sale_data->paid_amount ,$general_setting->decimal, '.', ',')}}
                </td>
            </tr>
            <tr>
                <td class="td-text" colspan="3" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);">
                    {{trans('file.Due')}}
                </td>
                <td class="td-text" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);text-align: center;font-size: 15px;">
                    {{number_format((float)($lims_sale_data->grand_total - $lims_sale_data->paid_amount) ,$general_setting->decimal, '.', ',')}}
                </td>
            </tr>
            <tr>
                <td class="td-text" colspan="3" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);">
                    {{trans('file.Total Due')}}
                </td>
                <td class="td-text" style="border:1px solid #222;padding:1px 3px;background-color:rgb(205, 218, 235);text-align: center;font-size: 15px;">
                    {{number_format($totalDue ,$general_setting->decimal, '.', ',')}}
                </td>
            </tr>
        </table>
        <table style="width: 100%; border-collapse: collapse;margin-top:-9px;">
            <tr>
                <td style="width: 100%; text-align: center">
                    <br>
                    <?php echo '<img style="max-width:100%" src="data:image/png;base64,' . DNS1D::getBarcodePNG($lims_sale_data->reference_no, 'C128') . '" alt="barcode"   />';?>
                    <br><br>
                    <?php echo '<img style="width:5%" src="data:image/png;base64,' . DNS2D::getBarcodePNG($qrText, 'QRCODE') . '" alt="barcode"   />';?>
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            localStorage.clear();
            function auto_print() {
                window.print();

            }
            //setTimeout(auto_print, 1000);
        </script>
    </body>
</html>
