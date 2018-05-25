@extends('layouts.app')

@section('content')
<div class="container">

    <h1>Fileinput {{ $fileinput->id }}
        <a href="{{ url('fileinput/' . $fileinput->id . '/edit') }}" class="btn btn-primary btn-xs" title="Edit Fileinput"><span class="glyphicon glyphicon-pencil" aria-hidden="true"/></a>
        {!! Form::open([
            'method'=>'DELETE',
            'url' => ['fileinput', $fileinput->id],
            'style' => 'display:inline'
        ]) !!}
            {!! Form::button('<span class="glyphicon glyphicon-trash" aria-hidden="true"/>', array(
                    'type' => 'submit',
                    'class' => 'btn btn-danger btn-xs',
                    'title' => 'Delete Fileinput',
                    'onclick'=>'return confirm("Confirm delete?")'
            ));!!}
        {!! Form::close() !!}
    </h1>
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover">
            <tbody>
                <tr>
                    <th>ID</th><td>{{ $fileinput->id }}</td>
                </tr>
                <tr><th> Url </th><td> {{ $fileinput->url }} </td></tr><tr><th> Desc </th><td> {{ $fileinput->desc }} </td></tr>
            </tbody>
        </table>
    </div>

</div>
@endsection
