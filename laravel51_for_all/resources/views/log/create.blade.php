@extends('layouts.app')

@section('content')
<div class="container">

    <h1>Create New Log</h1>
    <hr/>

    {!! Form::open(['url' => '/log', 'class' => 'form-horizontal']) !!}

                <div class="form-group {{ $errors->has('uid') ? 'has-error' : ''}}">
                {!! Form::label('uid', trans('log.uid'), ['class' => 'col-sm-3 control-label']) !!}
                <div class="col-sm-6">
                    {!! Form::number('uid', null, ['class' => 'form-control']) !!}
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
                    {!! Form::number('t', null, ['class' => 'form-control']) !!}
                    {!! $errors->first('t', '<p class="help-block">:message</p>') !!}
                </div>
            </div>
            <div class="form-group {{ $errors->has('ip') ? 'has-error' : ''}}">
                {!! Form::label('ip', trans('log.ip'), ['class' => 'col-sm-3 control-label']) !!}
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
            {!! Form::submit('Create', ['class' => 'btn btn-primary form-control']) !!}
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