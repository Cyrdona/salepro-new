@extends('backend.layout.main') @section('content')

@push('css')
<style>
.table td {
    background: #FFF;
}
</style>
@endpush

@if(session()->has('message'))
<div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
<div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif

<section>
    <div class="container-fluid">
        <div class="card-header mt-2">
            <h3 class="text-center">{{trans('file.Addon List')}}</h3>
        </div>
    </div>
    <div class="table-responsive container-fluid mt-5">
        <table id="department-table" class="table">
            <thead>
                <tr>
                    <th>{{trans('file.name')}}</th>
                    <th style="width:65%">{{trans('file.Description')}}</th>
                    <th style="width:200px" class="not-exported">{{trans('file.action')}}</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>SalePro SaaS</td>
                    <td>It's a standalone application to start subscription business with SalePro. It is a multi tenant system and each client will have their separate database. This application comes with free landing page, unlimited custom pages, blog, payment gateway and lots more.</td>
                    <td>
                        <div class="btn-group">
                            <a target="_blank" href="https://saleprosaas.com/" class="btn btn-success btn-sm" title="SalePro Saas Demo"><i class="dripicons-web"></i> Demo</a>&nbsp;&nbsp;
                            <a target="_blank" href="https://saleprosaas.com/documentation" class="btn btn-danger btn-sm" title="SalePro Saas Documentation"><i class="dripicons-document "></i> Documentation</a>&nbsp;&nbsp;
                        </div>
                        <div class="btn-group mt-2">
                            @if(!in_array('saas',explode(',',$general_setting->modules)))
                            <a target="_blank" href="https://codecanyon.net/user/lioncoders/portfolio" class="btn btn-primary btn-sm" title="SalePro Saas"><i class="dripicons-basket"></i> Buy Now</a>&nbsp;&nbsp;
                            <a class="btn btn-info btn-sm" href="{{route('saas-install-step-1')}}"><i class="dripicons-download"></i> Install</a>
                            @else
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#installeSaasModal"><i class="dripicons-download"></i> Update</button>
                            @endif
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>SalePro eCommerce</td>
                    <td>Start an eCommerce store and manage all aspects of your eCommerce site from within SalePro. From inventories, customers, deliveries to CMS website, SEO and everything in between!</td>
                    <td>
                        <div class="btn-group">
                            @if(!in_array('ecommerce',explode(',',$general_setting->modules)))
                            <a target="_blank" href="https://codecanyon.net/user/lioncoders/portfolio" class="btn btn-primary btn-sm" title="SalePro eCommerce"><i class="dripicons-basket"></i> Buy Now</a>&nbsp;&nbsp;
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#installeCommerceModal"><i class="dripicons-download"></i> Install</button>
                            @else
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#installeCommerceModal"><i class="dripicons-download"></i> Update</button>
                            @endif
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>SalePro WooCommerce</td>
                    <td>An addon to integrate SalePro with your existing WooCommerce website.</td>
                    <td>
                        <div class="btn-group">
                            @if (!\Schema::hasColumn('products', 'woocommerce_product_id'))
                            <a target="_blank" href="https://codecanyon.net/item/salepro-woocommerce-addon/46380606" class="btn btn-primary btn-sm" title="Point of sale to WooCommerce add-on for SalePro POS & inventory management php script"><i class="dripicons-basket"></i> Buy Now</a>&nbsp;&nbsp;
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#installWooCommerceModal"><i class="dripicons-download"></i> Install</button>
                            @else
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#installWooCommerceModal"><i class="dripicons-download"></i> Update</button>
                            @endif
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>

<div id="installWooCommerceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            {!! Form::open(['route' => 'woocommerce.install', 'method' => 'post']) !!}
            <div class="modal-header">
                <h5 class="modal-title">Install WooCommerce Add-on</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
                <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                <form>
                    <div class="form-group">
                        <label>Envato Purchase Code *</label>
                        {{Form::text('purchase_code',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => 'Type envato purchase code for WooCommerce addon...'))}}
                    </div>
                    <div class="form-group">
                        <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary">
                    </div>
                </form>
            </div>
            {{ Form::close() }}
        </div>
    </div>
</div>

<div id="installeCommerceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            {!! Form::open(['route' => 'ecommerce.install', 'method' => 'post']) !!}
            <div class="modal-header">
                <h5 class="modal-title">Install eCommerce Add-on</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
                <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                <form>
                    <div class="form-group">
                        <label>Envato Purchase Code *</label>
                        {{Form::text('purchase_code',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => 'Type envato purchase code for eCommerce addon...'))}}
                    </div>
                    <div class="form-group">
                        <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary">
                    </div>
                </form>
            </div>
            {{ Form::close() }}
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script type="text/javascript">
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });


    // $('#department-table').DataTable( {
    //     "order": [],
    //     'language': {
    //         'lengthMenu': '_MENU_ {{trans("file.records per page")}}',
    //          "info":      '<small>{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)</small>',
    //         "search":  '{{trans("file.Search")}}',
    //         'paginate': {
    //                 'previous': '<i class="dripicons-chevron-left"></i>',
    //                 'next': '<i class="dripicons-chevron-right"></i>'
    //         }
    //     },
    //     'columnDefs': [
    //         {
    //             "orderable": false,
    //             'targets': [0, 2]
    //         },
    //         {
    //             'render': function(data, type, row, meta){
    //                 if(type === 'display'){
    //                     data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
    //                 }

    //                return data;
    //             },
    //         }
    //     ],
    //     'select': { style: 'multi',  selector: 'td:first-child'},
    //     'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
    //     dom: '<"row"lfB>rtip',
    //     buttons: [
    //         {
    //             extend: 'pdf',
    //             text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
    //             exportOptions: {
    //                 columns: ':visible:Not(.not-exported)',
    //                 rows: ':visible'
    //             },
    //             footer:true
    //         },
    //         {
    //             extend: 'excel',
    //             text: '<i title="export to excel" class="dripicons-document-new"></i>',
    //             exportOptions: {
    //                 columns: ':visible:Not(.not-exported)',
    //                 rows: ':visible'
    //             },
    //             footer:true
    //         },
    //         {
    //             extend: 'csv',
    //             text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
    //             exportOptions: {
    //                 columns: ':visible:Not(.not-exported)',
    //                 rows: ':visible'
    //             },
    //             footer:true
    //         },
    //         {
    //             extend: 'print',
    //             text: '<i title="print" class="fa fa-print"></i>',
    //             exportOptions: {
    //                 columns: ':visible:Not(.not-exported)',
    //                 rows: ':visible'
    //             },
    //             footer:true
    //         },
    //         {
    //             extend: 'colvis',
    //             text: '<i title="column visibility" class="fa fa-eye"></i>',
    //             columns: ':gt(0)'
    //         },
    //     ],
    // });
</script>
@endpush
