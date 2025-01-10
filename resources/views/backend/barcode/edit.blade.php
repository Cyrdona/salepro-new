@extends('backend.layout.main')
@section('content')
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>{{trans('file.Edit Barcode Sticker Setting')}}</h4>
                    </div>
                    <div class="card-body">
                        {!! Form::open(['url' => action([\App\Http\Controllers\BarcodeController::class, 'update'], [$barcode->id]), 'method' => 'PUT',
                            'id' => 'add_barcode_settings_form' ]) !!}
                            <div class="box box-solid">
                                <div class="box-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                    <div class="form-group">
                                        {!! Form::label('name', __('file.Sticker Sheet setting Name') . ':*') !!}
                                        {!! Form::text('name', $barcode->name, ['class' => 'form-control', 'required',
                                        'placeholder' => __('file.Sticker Sheet setting Name')]); !!}
                                    </div>
                                    </div>
                                    <div class="col-sm-12">
                                    <div class="form-group">
                                        {!! Form::label('description', __('file.Sticker Sheet setting Description') ) !!}
                                        {!! Form::textarea('description', $barcode->description, ['class' => 'form-control',
                                        'placeholder' => __('file.Sticker Sheet setting Description'), 'rows' => 3]); !!}
                                    </div>
                                    </div>
                                    <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="">
                                        <label>
                                            {!! Form::checkbox('is_continuous', 1, $barcode->is_continuous, ['id' => 'is_continuous']); !!} @lang('file.Continuous feed or rolls')</label>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-sm-6">
                                    <div class="form-group">
                                        {!! Form::label('top_margin', __('file.Additional top margin') . ' ('. __('file.In Inches') . '):*') !!}
                                        <div class="input-group">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span>
                                        </span>
                                        {!! Form::number('top_margin', $barcode->top_margin, ['class' => 'form-control',
                                        'placeholder' => __('file.top_margin'), 'min' => 0, 'step' => 0.00001, 'required']); !!}
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-sm-6">
                                    <div class="form-group">
                                        {!! Form::label('left_margin', __('file.Additional left margin') . ' ('. __('file.In Inches') . '):*') !!}
                                        <div class="input-group">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
                                        </span>
                                        {!! Form::number('left_margin', $barcode->left_margin, ['class' => 'form-control',
                                        'placeholder' => __('file.Additional left margin'), 'min' => 0, 'step' => 0.00001, 'required']); !!}
                                        </div>
                                    </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-sm-6">
                                    <div class="form-group">
                                        {!! Form::label('width', __('file.Width of sticker') . ' ('. __('file.In Inches') . '):*') !!}
                                        <div class="input-group">

                                        {!! Form::number('width', $barcode->width, ['class' => 'form-control',
                                        'placeholder' => __('file.Width of sticker'), 'min' => 0.1, 'step' => 0.00001, 'required']); !!}
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-sm-6">
                                    <div class="form-group">
                                        {!! Form::label('height', __('file.Height of sticker') . ' ('. __('file.In Inches') . '):*') !!}
                                        <div class="input-group">

                                        {!! Form::number('height', $barcode->height, ['class' => 'form-control',
                                            'placeholder' => __('barcode.height'), 'min' => 0.1, 'step' => 0.00001, 'required']); !!}
                                        </div>
                                    </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-sm-6">
                                    <div class="form-group">
                                        {!! Form::label('paper_width', __('file.Paper width') . ' ('. __('file.In Inches') . '):*') !!}
                                        <div class="input-group">

                                        {!! Form::number('paper_width', $barcode->paper_width, ['class' => 'form-control',
                                        'placeholder' => __('file.Paper width'), 'min' => 0.1, 'step' => 0.00001, 'required']); !!}
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-sm-6 paper_height_div">
                                    <div class="form-group">
                                        {!! Form::label('paper_height', __('file.Paper height') . ' ('. __('file.In Inches') . '):*') !!}
                                        <div class="input-group">

                                        {!! Form::number('paper_height', $barcode->paper_height, ['class' => 'form-control',
                                        'placeholder' => __('file.Paper height'), 'min' => 0.1, 'step' => 0.00001, 'required']); !!}
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-sm-6">
                                    <div class="form-group">
                                        {!! Form::label('stickers_in_one_row', __('file.Stickers in one row') . ':*') !!}
                                        <div class="input-group">

                                        {!! Form::number('stickers_in_one_row', $barcode->stickers_in_one_row, ['class' => 'form-control',
                                        'placeholder' => __('file.Stickers in one row'), 'min' => 1, 'required']); !!}
                                        </div>
                                    </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-sm-6">
                                    <div class="form-group">
                                        {!! Form::label('row_distance', __('file.Distance between two rows') . ' ('. __('file.In Inches') . '):*') !!}
                                        <div class="input-group">

                                        {!! Form::number('row_distance', $barcode->row_distance, ['class' => 'form-control',
                                        'placeholder' => __('file.Distance between two rows'), 'min' => 0, 'step' => 0.00001, 'required']); !!}
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-sm-6">
                                    <div class="form-group">
                                        {!! Form::label('col_distance', __('file.Distance between two columns') . ' ('. __('file.In Inches') . '):*') !!}
                                        <div class="input-group">

                                        {!! Form::number('col_distance', $barcode->col_distance, ['class' => 'form-control',
                                        'placeholder' => __('file.Distance between two columns'), 'min' => 0, 'step' => 0.00001, 'required']); !!}
                                        </div>
                                    </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-sm-6 stickers_per_sheet_div">
                                    <div class="form-group">
                                        {!! Form::label('stickers_in_one_sheet', __('file.No. of Stickers per sheet') . ':*') !!}
                                        <div class="input-group">

                                        {!! Form::number('stickers_in_one_sheet', $barcode->stickers_in_one_sheet, ['class' => 'form-control',
                                        'placeholder' => __('file.No. of Stickers per sheet'), 'min' => 1, 'required']); !!}
                                        </div>
                                    </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-sm-6 stickers_per_sheet_div @if( $barcode->is_continuous ) {{ 'hide' }} @endif">
                                        <div class="form-group">
                                          {!! Form::label('stickers_in_one_sheet', __('barcode.stickers_in_one_sheet') . ':*') !!}
                                          <div class="input-group">
                                            {!! Form::number('stickers_in_one_sheet', $barcode->stickers_in_one_sheet, ['class' => 'form-control',
                                            'placeholder' => __('barcode.stickers_in_one_sheet'), 'min' => 1, 'required']); !!}
                                          </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-sm-6"></div>
                                    <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="">
                                        <label>
                                            {!! Form::checkbox('is_default', 1, $barcode->is_default); !!} @lang('file.Set as default')</label>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="clearfix"></div>

                                    <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary btn-big">@lang('file.update')</button>
                                    </div>
                                </div>
                                </div>
                            </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
