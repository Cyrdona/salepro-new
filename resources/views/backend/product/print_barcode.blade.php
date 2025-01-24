@extends('backend.layout.main') @section('content')
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
<style>
@media print {
    * {
        font-size:12px;
        line-height: 20px;
    }
    td,th {padding: 5px 0;}
    .hidden-print {
        display: none !important;
    }
    @page { size: landscape; margin: 0 !important; }
    .barcodelist {
        max-width: 378px;
    }
    .barcodelist img {
        max-width: 150px;
    }
}
</style>
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>{{trans('file.print_barcode')}}</h4>
                    </div>
                    {{-- <form action="{{ route('print.label') }}" method="post"> --}}
	                {!! Form::open(['url' => '#', 'method' => 'post', 'id' => 'preview_setting_form', 'onsubmit' => 'return false']) !!}

                        {{-- @csrf --}}
                        <div class="card-body">
                            <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>{{trans('file.add_product')}} *</label>
                                            <div class="search-box input-group">
                                                <button type="button" class="btn btn-secondary btn-lg"><i class="fa fa-barcode"></i></button>
                                                <input type="text" name="product_code_name" id="lims_productcodeSearch" placeholder="Please type product code and select..." class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3 mb-5">
                                        <div class="col-md-12">
                                            <div class="table-responsive mt-3">
                                                <table id="myTable" class="table table-hover order-list">
                                                    <thead>
                                                        <tr>
                                                            <th>{{trans('file.name')}}</th>
                                                            <th>{{trans('file.Code')}}</th>
                                                            <th>{{trans('file.Quantity')}}</th>
                                                            <th><i class="dripicons-trash"></i></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        @foreach ($preLoadedproducts as $key=>$preLoadedproduct)
                                                        <tr data-imagedata="{{$preLoadedproduct[3]}}" data-price="{{$preLoadedproduct[2]}}" data-promo-price="{{$preLoadedproduct[4]}}" data-currency="{{$preLoadedproduct[5]}}" data-currency-position="{{$preLoadedproduct[6]}}">
                                                            <td>{{$preLoadedproduct[0]}}</td>
                                                            <td class="product-code">{{$preLoadedproduct[1]}}</td>
                                                            <td><input type="number" class="form-control qty" name="products[{{$key}}][quantity]" value="1" /></td>
                                                            <td><button type="button" class="ibtnDel btn btn-md btn-danger">Delete</button></td>
                                                            <td><input type="hidden" name="products[{{$key}}][product_id]" value="{{$preLoadedproduct[8]}}"></td>
                                                            <td><input type="hidden" name="products[{{$key}}][product_name]" value="{{$preLoadedproduct[0]}}"></td>
                                                            <td><input type="hidden" name="products[{{$key}}][sub_sku]" value="{{$preLoadedproduct[1]}}"></td>
                                                            <td><input type="hidden" name="products[{{$key}}][product_price]" value="{{$preLoadedproduct[2]}}"></td>
                                                            <td><input type="hidden" name="products[{{$key}}][product_promo_price]" value="{{$preLoadedproduct[4]}}"></td>
                                                            <td><input type="hidden" name="products[{{$key}}][currency]" value="{{$preLoadedproduct[5]}}"></td>
                                                            <td><input type="hidden" name="products[{{$key}}][currency_position]" value="{{$preLoadedproduct[6]}}"></td>
                                                            <td><input type="hidden" name="products[{{$key}}][brand_name]" value="{{$preLoadedproduct['11']}}"></td>
                                                        </tr>
                                                        @endforeach
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    {{-- CUT --}}
                                    <label><strong>{{trans('file.Information on Label')}} *</strong></label>

                                    <div class="row mt-2">
                                        <div class="col-md-4">
                                            <strong><input type="checkbox" name="print[name]" checked value="1" /> {{trans('file.Product Name')}}</strong>&nbsp;
                                            <div class="d-flex justify-content-start">
                                                <div>Size:</div>&nbsp;
                                                <div><input type="number" name="print[name_size]" value="15"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <strong><input type="checkbox" name="print[price]" checked value="1" /> {{trans('file.Price')}}</strong>&nbsp;
                                            <div class="d-flex justify-content-start">
                                                <div>Size:</div>&nbsp;
                                                <div><input type="number" name="print[price_size]" value="15"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <strong><input type="checkbox" name="print[promo_price]" checked value="1" /> {{trans('file.Promotional Price')}}</strong>
                                            <div class="d-flex justify-content-start">
                                                <div>Size:</div>&nbsp;
                                                <div><input type="number" name="print[promo_price_size]" value="15"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-md-4">
                                            <strong><input type="checkbox" name="print[business_name]" checked value="1" /> {{trans('file.Business Name')}}</strong>
                                            <div class="d-flex justify-content-start">
                                                <div>Size:</div>&nbsp;
                                                <div><input type="number" name="print[business_name_size]" value="15"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <strong><input type="checkbox" name="print[brand_name]" checked value="1" /> {{trans('file.Brand')}}</strong>
                                            <div class="d-flex justify-content-start">
                                                <div>Size:</div>&nbsp;
                                                <div><input type="number" name="print[brand_name_size]" value="15"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="print[variations]" value="1">
                                    <input type="hidden" name="print[variations_size]" value="17">
                                    <input type="hidden" name="print[packing_date]" value="1">
                                    <input type="hidden" name="print[packing_date_size	]" value="12">
                                    <hr>
                                    <div class="row mt-4">
                                        <div class="col-md-8">
                                            <label><strong>Paper Size *</strong></label>
                                            {!! Form::select('barcode_setting', $barcode_settings, !empty($default) ? $default->id : null, ['class' => 'form-control']); !!}

                                            {{-- <select class="form-control" name="paper_size" required id="paper-size">
                                                <option value="0">Select paper size...</option>
                                                <option value="36">36 mm (1.4 inch)</option>
                                                <option value="24">24 mm (0.94 inch)</option>
                                                <option value="18">18 mm (0.7 inch)</option>
                                            </select> --}}
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group mt-3">
				                                <button type="button" id="labels_preview" class="btn btn-primary btn-big">@lang( 'file.submit' )</button>

                                                {{-- <button type="submit" value="{{trans('file.submit')}}" class="btn btn-primary"> --}}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {{-- </form> --}}
	                {!! Form::close() !!}

                </div>
            </div>
        </div>
    </div>

    <div id="print-barcode" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                  <h5 id="modal_header" class="modal-title">{{trans('file.Barcode')}}</h5>&nbsp;&nbsp;
                  <button id="print-btn" type="button" class="btn btn-default btn-sm"><i class="dripicons-print"></i> {{trans('file.Print')}}</button>
                  <button type="button" id="close-btn" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <div id="label-content">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

@push('scripts')
<script type="text/javascript">

    $("ul#product").siblings('a').attr('aria-expanded','true');
    $("ul#product").addClass("show");
    $("ul#product #printBarcode-menu").addClass("active");
    <?php $productArray = []; ?>
    var lims_product_code = [
    @foreach($lims_product_list_without_variant as $product)
        <?php
            $productArray[] = htmlspecialchars($product->code . ' (' . preg_replace('/[\n\r]/', "<br>", htmlspecialchars($product->name)) . ')');
        ?>
    @endforeach
    @foreach($lims_product_list_with_variant as $product)
        <?php
            $productArray[] = htmlspecialchars($product->item_code . ' (' . preg_replace('/[\n\r]/', "<br>", htmlspecialchars($product->name)) . ')');
        ?>
    @endforeach
    <?php
        echo  '"'.implode('","', $productArray).'"';
    ?>
    ];

    var lims_productcodeSearch = $('#lims_productcodeSearch');
    var key = 1;
    lims_productcodeSearch.autocomplete({
        source: function(request, response) {
            var matcher = new RegExp(".?" + $.ui.autocomplete.escapeRegex(request.term), "i");
            response($.grep(lims_product_code, function(item) {
                console.log(matcher.test(item));
                return matcher.test(item);
            }));
        },
        select: function(event, ui) {
            var data = ui.item.value;
            $.ajax({
                type: 'GET',
                url: 'lims_product_search',
                data: {
                    data: data
                },
                success: function(responseData) {
                    data = responseData[0];
                    var flag = 1;

                    //console.log(data[11]);

                    $(".product-code").each(function() {
                        if ($(this).text() == data[1]) {
                            alert('Duplicate input is not allowed!')
                            flag = 0;
                        }
                    });
                    $("input[name='product_code_name']").val('');
                    if(flag){
                        var newRow = $('<tr data-imagedata="'+data[3]+'" data-price="'+data[2]+'" data-promo-price="'+data[4]+'" data-currency="'+data[5]+'" data-currency-position="'+data[6]+'">');
                        var cols = '';
                        cols += '<td>' + data[0] + '</td>';
                        cols += '<td class="product-code">' + data[1] + '</td>';
                        cols += '<td><input type="number" class="form-control qty" name="products['+ key +'][quantity]" value="1" /></td>';
                        cols += '<td><button type="button" class="ibtnDel btn btn-md btn-danger">Delete</button></td>';
                        cols += '<td><input type="hidden" name="products['+ key +'][product_id]" value="'+data[8]+'"></td>';
                        cols += '<td><input type="hidden" name="products['+ key +'][product_name]" value="'+data[0]+'"></td>';
                        cols += '<td><input type="hidden" name="products['+ key +'][sub_sku]" value="'+data[1]+'"></td>';
                        cols += '<td><input type="hidden" name="products['+ key +'][product_price]" value="'+data[2]+'"></td>';
                        cols += '<td><input type="hidden" name="products['+ key +'][product_promo_price]" value="'+data[4]+'"></td>';
                        cols += '<td><input type="hidden" name="products['+ key +'][currency]" value="'+data[5]+'"></td>';
                        cols += '<td><input type="hidden" name="products['+ key +'][currency_position]" value="'+data[6]+'"></td>';
                        cols += '<td><input type="hidden" name="products['+ key +'][brand_name]" value="'+data[11]+'"></td>';


                        newRow.append(cols);
                        $("table.order-list tbody").append(newRow);
                        key++;
                    }
                }
            });
        }
    });

    //Delete product
    $("table.order-list tbody").on("click", ".ibtnDel", function(event) {
        rowindex = $(this).closest('tr').index();
        $(this).closest("tr").remove();
    });
    $('#labels_preview').click(function() {
            var url = "{{route('print.label')}}" + "?" + $('form#preview_setting_form').serialize();
            window.open(url, 'newwindow');
    });

</script>
@endpush
