@extends('backend.layout.main') @section('content')

@if(session()->has('message'))
<div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
<div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif

@push('css')
<style>
    .custom-switch {
        padding-left: .5rem;
    }

    .custom-switch .custom-control-label::before {
        left: -2.25rem;
        width: 1.75rem;
        pointer-events: all;
        border-radius: .5rem;
    }

    .custom-switch .custom-control-label::after {
        top: calc(.25rem + 2px);
        left: calc(-2.25rem + 2px);
        width: calc(1rem - 4px);
        height: calc(1rem - 4px);
        background-color: #adb5bd;
        border-radius: .5rem;
        transition: background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out, -webkit-transform .15s ease-in-out;
        transition: transform .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        transition: transform .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out, -webkit-transform .15s ease-in-out;
    }

    .custom-control-input:checked~.custom-control-label::before {
        color: #fff;
        border-color: #007bff;
        background-color: #007bff;
    }

    .custom-switch .custom-control-input:checked~.custom-control-label::after {
        background-color: #fff;
        -webkit-transform: translateX(.75rem);
        transform: translateX(.75rem);
    }
</style>
@endpush
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>{{trans('file.Payment Gateways')}}</h4>
                    </div>
                    <div class="card-body">
                        <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                        {!! Form::open(['route' => 'setting.gateway.update', 'files' => true, 'method' => 'post']) !!}
                        <div class="row">
                            @foreach($payment_gateways as $pg)
                            <div class="col-md-12 mt-3 mb-3">
                                <h4 class="d-flex align-items-center justify-content-between">
                                    {{$pg->name}} {{trans('file.Details')}}

                                    <div style="width:200px">
                                        <select class="form-control" name="module_status[{{ $loop->index }}][]" multiple>
                                            @php
                                                $modules = json_decode($pg->module_status, true);
                                            @endphp

                                            @foreach(['salepro', 'ecommerce'] as $module)
                                                <option value="{{ $module }}" {{ !empty($modules[$module]) && $modules[$module] ? 'selected' : '' }}>
                                                    {{ ucfirst($module) }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </h4>
                                <hr>
                                <input type="hidden" name="pg_name[]" class="form-control" value="{{$pg->name}}" />
                                @php
                                $lines = explode(';',$pg->details);
                                $keys = explode(',', $lines[0]);
                                $vals = explode(',', $lines[1]);

                                $results = array_combine($keys, $vals);
                                @endphp
                                @foreach ($results as $key => $value)
                                <div class="form-group">
                                    <label>{{$key}}</label>
                                    @if($key == 'Mode')
                                        <select name="{{$pg->name.'_'.str_replace(' ','_',$key)}}" class="selectpicker form-control">
                                            <option @if($value == 'sandbox') selected @endif value="sandbox">Sandbox</option>
                                            <option @if($value == 'live') selected @endif value="live">Live</option>
                                        </select>
                                    @else
                                        <input type="text" name="{{$pg->name.'_'.str_replace(' ','_',$key)}}" class="form-control" value="{{$value}}" />
                                    @endif

                                </div>
                                @endforeach
                            </div>
                            @endforeach

                        </div>
                        <div class="form-group">
                            <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary">
                        </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

@push('scripts')
<script>
    if ($('.activate').is(':checked')) {
        $(this).siblings('input[type="text"]').val(1);
    } else {
        $(this).siblings('input[type="text"]').val(0);
    }
    $(document).on('click', '.activate', function(){
        if ($(this).is(':checked')) {
            $(this).siblings('input[type="hidden"]').val(1);
        } else if (!$(this).is(':checked')) {
            $(this).siblings('input[type="hidden"]').val(0);
        }
    })
</script>
@endpush
