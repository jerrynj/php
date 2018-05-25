@extends('layouts.app')

@section('content')
<div class="container">

    <h1>Edit Fileinput {{ $fileinput->id }}</h1>

    {!! Form::model($fileinput, [
        'method' => 'PATCH',
        'url' => ['/fileinput', $fileinput->id],
        'class' => 'form-horizontal'
    ]) !!}

                <div class="form-group {{ $errors->has('url') ? 'has-error' : ''}}">
                {!! Form::label('url', 'Url', ['class' => 'col-sm-3 control-label']) !!}
                <div class="col-sm-6">
                    {!! Form::text('url', null, ['class' => 'form-control']) !!}
                    {!! $errors->first('url', '<p class="help-block">:message</p>') !!}
                </div>
            </div>
            <div class="form-group {{ $errors->has('desc') ? 'has-error' : ''}}">
                {!! Form::label('desc', 'Desc', ['class' => 'col-sm-3 control-label']) !!}
                <div class="col-sm-6">
                    {!! Form::textarea('desc', null, ['class' => 'form-control']) !!}
                    {!! $errors->first('desc', '<p class="help-block">:message</p>') !!}
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