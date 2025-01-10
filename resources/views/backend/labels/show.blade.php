@extends('backend.layout.main')
@section('content')

<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>{{trans('file.print_barcode')}}</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        {!! Form::open(['url' => '#', 'method' => 'post', 'id' => 'preview_setting_form', 'onsubmit' => 'return false']) !!}
                                        <div class="row">
                                            <div class="col-sm-8 col-sm-offset-2">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <i class="fa fa-search"></i>
                                                        </span>
                                                        {!! Form::text('search_product', null, ['class' => 'form-control', 'id' => 'search_product_for_label', 'placeholder' => __('lang_v1.enter_product_name_to_print_labels'), 'autofocus']); !!}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-10 col-sm-offset-2">
                                                <table class="table table-bordered table-striped table-condensed" id="product_table">
                                                    <thead>
                                                        <tr>
                                                            <th>@lang( 'barcode.products' )</th>
                                                            <th>@lang( 'barcode.no_of_labels' )</th>
                                                            @if(request()->session()->get('business.enable_lot_number') == 1)
                                                                <th>@lang( 'lang_v1.lot_number' )</th>
                                                            @endif
                                                            @if(request()->session()->get('business.enable_product_expiry') == 1)
                                                                <th>@lang( 'product.exp_date' )</th>
                                                            @endif
                                                            <th>@lang('lang_v1.packing_date')</th>
                                                            <th>@lang('lang_v1.selling_price_group')</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        {{-- @include('labels.partials.show_table_rows', ['index' => 0]) --}}
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label><strong>Paper Size *</strong></label>
						                {!! Form::select('barcode_setting', $barcode_settings, !empty($default) ? $default->id : null, ['class' => 'form-control']); !!}
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 text-center mt-3">
                                        <button type="button" id="labels_preview" class="btn btn-primary">@lang( 'file.submit' )</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
@push('scripts')
<script>
$(document).ready(function() {
    $('table#product_table tbody').find('.label-date-picker').each( function(){
        $(this).datepicker({
            autoclose: true
        });
    });
    //Add products
    if ($('#search_product_for_label').length > 0) {
        $('#search_product_for_label')
            .autocomplete({
                source: '/purchases/get_products?check_enable_stock=false',
                minLength: 2,
                response: function(event, ui) {
                    if (ui.content.length == 1) {
                        ui.item = ui.content[0];
                        $(this)
                            .data('ui-autocomplete')
                            ._trigger('select', 'autocompleteselect', ui);
                        $(this).autocomplete('close');
                    } else if (ui.content.length == 0) {
                        swal(LANG.no_products_found);
                    }
                },
                select: function(event, ui) {
                    $(this).val(null);
                    get_label_product_row(ui.item.product_id, ui.item.variation_id);
                },
            })
            .autocomplete('instance')._renderItem = function(ul, item) {
            return $('<li>')
                .append('<div>' + item.text + '</div>')
                .appendTo(ul);
        };
    }

    $('input#is_show_price').change(function() {
        if ($(this).is(':checked')) {
            $('div#price_type_div').show();
        } else {
            $('div#price_type_div').hide();
        }
    });

    $('button#labels_preview').click(function() {
        alert('hello');
        if ($('form#preview_setting_form table#product_table tbody tr').length > 0) {
            var url = base_path + '/labels/preview?' + $('form#preview_setting_form').serialize();

            window.open(url, 'newwindow');

            // $.ajax({
            //     method: 'get',
            //     url: '/labels/preview',
            //     dataType: 'json',
            //     data: $('form#preview_setting_form').serialize(),
            //     success: function(result) {
            //         if (result.success) {
            //             $('div.display_label_div').removeClass('hide');
            //             $('div#preview_box').html(result.html);
            //             __currency_convert_recursively($('div#preview_box'));
            //         } else {
            //             toastr.error(result.msg);
            //         }
            //     },
            // });
        } else {
            swal(LANG.label_no_product_error).then(value => {
                $('#search_product_for_label').focus();
            });
        }
    });

    $(document).on('click', 'button#print_label', function() {
        window.print();
    });
});

function get_label_product_row(product_id, variation_id) {
    if (product_id) {
        var row_count = $('table#product_table tbody tr').length;
        $.ajax({
            method: 'GET',
            url: '/labels/add-product-row',
            dataType: 'html',
            data: { product_id: product_id, row_count: row_count, variation_id: variation_id },
            success: function(result) {
                $('table#product_table tbody').append(result);

                $('table#product_table tbody').find('.label-date-picker').each( function(){
                    $(this).datepicker({
                        autoclose: true
                    });
                });
            },
        });
    }
}

</script>
@endpush
