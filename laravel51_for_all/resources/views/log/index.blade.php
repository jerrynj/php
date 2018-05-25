@extends('layouts.app')

@section('content')
<div class="container">

    <h1>Log <a href="{{ url('/log/create') }}" class="btn btn-primary btn-xs" title="Add New Log"><span class="glyphicon glyphicon-plus" aria-hidden="true"/></a></h1>
    <div class="table">
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>S.No</th><th> {{ trans('log.uid') }} </th><th> {{ trans('log.name') }} </th><th> {{ trans('log.t') }} </th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
            {{-- */$x=0;/* --}}
            @foreach($log as $item)
                {{-- */$x++;/* --}}
                <tr>
                    <td>{{ $x }}</td>
                    <td>{{ $item->uid }}</td><td>{{ $item->name }}</td><td>{{ $item->t }}</td>
                    <td>
                        <a href="{{ url('/log/' . $item->id) }}" class="btn btn-success btn-xs" title="View Log"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"/></a>
                        <a href="{{ url('/log/' . $item->id . '/edit') }}" class="btn btn-primary btn-xs" title="Edit Log"><span class="glyphicon glyphicon-pencil" aria-hidden="true"/></a>
                        {!! Form::open([
                            'method'=>'DELETE',
                            'url' => ['/log', $item->id],
                            'style' => 'display:inline'
                        ]) !!}
                            {!! Form::button('<span class="glyphicon glyphicon-trash" aria-hidden="true" title="Delete Log" />', array(
                                    'type' => 'submit',
                                    'class' => 'btn btn-danger btn-xs',
                                    'title' => 'Delete Log',
                                    'onclick'=>'return confirm("Confirm delete?")'
                            ));!!}
                        {!! Form::close() !!}
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
        <div class="pagination"> {!! $log->render() !!} </div>
    </div>

</div>
@endsection
