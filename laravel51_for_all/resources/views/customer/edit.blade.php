@extends('layouts.app')

@section('content')
<div class="container">

    <h1>Edit Log {{ $log->id }} </h1>

    {!! Form::model($log, [
    'method' => 'PATCH',
    'url' => ['/log', $log->id],
    'class' => 'form-horizontal'
    ]) !!}

    <div class="form-group {{ $errors->has('uid') ? 'has-error' : ''}}">
        {!! Form::label('uid', trans('log.uid'), ['class' => 'col-sm-3 control-label']) !!}
        <div class="col-sm-6">
            {!! Form::select('uid', array('1' => 'YES', '0' => 'NO'), $log->uid,['class' => 'form-control']) !!}
            {!! $errors->first('uid', '<p class="help-block">:message</p>') !!}
        </div>
    </div>
    <!--下拉框demo-->
    
    <div class="form-group {{ $errors->has('uid') ? 'has-error' : ''}}">
        {!! Form::label('uid', trans('log.uid'), ['class' => 'col-sm-3 control-label']) !!}
        <div class="col-sm-6">
            <select name="setting" id="setting" required>
                <option value="">========请选择========</option>
                @foreach($lists as $data)
                <option value="{{ $data->k }}" {{ ($log->id == $data->id ? ' selected="selected"' : '') }} rel="{{ $data->type }}">{{ $data->v }}</option>
                @endforeach
            </select>
            {!! $errors->first('uid', '<p class="help-block">:message</p>') !!}
        </div>
    </div>

    <div class="form-group {{ $errors->has('name') ? 'has-error' : ''}}">
        {!! Form::label('name', trans('log.name'), ['class' => 'col-sm-3 control-label']) !!}
        <div class="col-sm-6">
            {!! Form::text('name', null, ['class' => 'form-control', 'required' => 'required']) !!}
            {!! $errors->first('name', '<p class="help-block">:message</p>') !!}
        </div>
    </div>
    <div class="form-group {{ $errors->has('t') ? 'has-error' : ''}}">
        {!! Form::label('t', trans('log.t'), ['class' => 'col-sm-3 control-label']) !!}
        <div class="col-sm-6">
            {!! Form::number('t', $log->t, ['class' => 'form-control']) !!}
            {!! $errors->first('t', '<p class="help-block">:message</p>') !!}
        </div>
    </div>
    <div class="form-group {{ $errors->has('ip') ? 'has-error' : ''}}">
        {!! Form::label('format("Ymd, t)', trans('log.ip'), ['class' => 'col-sm-3 control-label']) !!}
        <div class="col-sm-6">
            {!! Form::text('ip', null, ['class' => 'form-control']) !!}
            {!! $errors->first('ip', '<p class="help-block">:message</p>') !!}
        </div>
    </div>
    <div class="form-group {{ $errors->has('log') ? 'has-error' : ''}}">
        {!! Form::label('log', trans('log.log'), ['class' => 'col-sm-3 control-label']) !!}
        <div class="col-sm-6">
            {!! Form::text('log', null, ['class' => 'form-control']) !!}
            {!! $errors->first('log', '<p class="help-block">:message</p>') !!}
        </div>
    </div>
    <div class="form-group {{ $errors->has('url') ? 'has-error' : ''}}">
        {!! Form::label('url', trans('log.url'), ['class' => 'col-sm-3 control-label']) !!}
        <div class="col-sm-6">
            {!! Form::text('url', null, ['class' => 'form-control']) !!}
            {!! $errors->first('url', '<p class="help-block">:message</p>') !!}
        </div>
    </div>



    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-3">
            {!! Form::submit('Update', ['class' => 'btn btn-primary form-control']) !!}
        </div>
    </div>
    {!! Form::close() !!}

    @if ($errors->any())
    <ul class="alert alert-danger">
        @foreach ($errors->all() as $error)
        <li>{{ $error }}</li>
        @endforeach
    </ul>
    @endif

</div>
@endsection