@extends('layouts.app')

@section('content')
<div class="container">

    <h1>Photo <a href="{{ url('/photo/create') }}" class="btn btn-primary btn-xs" title="Add New Photo"><span class="glyphicon glyphicon-plus" aria-hidden="true"/></a></h1>
    <div class="table">
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>S.No</th><th> {{ trans('photo.name') }} </th><th> {{ trans('photo.email') }} </th><th> {{ trans('photo.status') }} </th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
            {{-- */$x=0;/* --}}
            @foreach($photo as $item)
                {{-- */$x++;/* --}}
                <tr>
                    <td>{{ $x }}</td>
                    <td>{{ $item->name }}</td><td>{{ $item->email }}</td><td>{{ $item->status }}</td>
                    <td>
                        <a href="{{ url('/photo/' . $item->id) }}" class="btn btn-success btn-xs" title="View Photo"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"/></a>
                        <a href="{{ url('/photo/' . $item->id . '/edit') }}" class="btn btn-primary btn-xs" title="Edit Photo"><span class="glyphicon glyphicon-pencil" aria-hidden="true"/></a>
                        {!! Form::open([
                            'method'=>'DELETE',
                            'url' => ['/photo', $item->id],
                            'style' => 'display:inline'
                        ]) !!}
                            {!! Form::button('<span class="glyphicon glyphicon-trash" aria-hidden="true" title="Delete Photo" />', array(
                                    'type' => 'submit',
                                    'class' => 'btn btn-danger btn-xs',
                                    'title' => 'Delete Photo',
                                    'onclick'=>'return confirm("Confirm delete?")'
                            ));!!}
                        {!! Form::close() !!}
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
        <div class="pagination"> {!! $photo->render() !!} </div>
    </div>

</div>
@endsection
