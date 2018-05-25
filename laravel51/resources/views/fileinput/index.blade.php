@extends('layouts.app')

@section('content')
<div class="container">

    <h1>Fileinput <a href="{{ url('/fileinput/create') }}" class="btn btn-primary btn-xs" title="Add New Fileinput"><span class="glyphicon glyphicon-plus" aria-hidden="true"/></a></h1>
    <div class="table">
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>S.No</th><th> Url </th><th> Desc </th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
            {{-- */$x=0;/* --}}
            @foreach($fileinput as $item)
                {{-- */$x++;/* --}}
                <tr>
                    <td>{{ $x }}</td>
                    <td>{{ $item->url }}</td><td>{{ $item->desc }}</td>
                    <td>
                        <a href="{{ url('/fileinput/' . $item->id) }}" class="btn btn-success btn-xs" title="View Fileinput"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"/></a>
                        <a href="{{ url('/fileinput/' . $item->id . '/edit') }}" class="btn btn-primary btn-xs" title="Edit Fileinput"><span class="glyphicon glyphicon-pencil" aria-hidden="true"/></a>
                        {!! Form::open([
                            'method'=>'DELETE',
                            'url' => ['/fileinput', $item->id],
                            'style' => 'display:inline'
                        ]) !!}
                            {!! Form::button('<span class="glyphicon glyphicon-trash" aria-hidden="true" title="Delete Fileinput" />', array(
                                    'type' => 'submit',
                                    'class' => 'btn btn-danger btn-xs',
                                    'title' => 'Delete Fileinput',
                                    'onclick'=>'return confirm("Confirm delete?")'
                            ));!!}
                        {!! Form::close() !!}
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
        <div class="pagination-wrapper"> {!! $fileinput->render() !!} </div>
    </div>

</div>
@endsection
