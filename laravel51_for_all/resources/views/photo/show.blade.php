@extends('layouts.app')

@section('content')
<div class="container">

    <h1>Photo {{ $photo->id }}</h1>
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover">
            <tbody>
                <tr>
                    <th>ID.</th><td>{{ $photo->id }}</td>
                </tr>
                <tr><th> {{ trans('photo.name') }} </th><td> {{ $photo->name }} </td></tr><tr><th> {{ trans('photo.email') }} </th><td> {{ $photo->email }} </td></tr><tr><th> {{ trans('photo.status') }} </th><td> {{ $photo->status }} </td></tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2">
                        <a href="{{ url('photo/' . $photo->id . '/edit') }}" class="btn btn-primary btn-xs" title="Edit Photo"><span class="glyphicon glyphicon-pencil" aria-hidden="true"/></a>
                        {!! Form::open([
                            'method'=>'DELETE',
                            'url' => ['photo', $photo->id],
                            'style' => 'display:inline'
                        ]) !!}
                            {!! Form::button('<span class="glyphicon glyphicon-trash" aria-hidden="true"/>', array(
                                    'type' => 'submit',
                                    'class' => 'btn btn-danger btn-xs',
                                    'title' => 'Delete Photo',
                                    'onclick'=>'return confirm("Confirm delete?")'
                            ));!!}
                        {!! Form::close() !!}
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>

</div>
@endsection