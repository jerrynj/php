@extends('layouts.app')

@section('content')
<div class="container">

    <h1>Customer <a href="{{ url('/customer/create') }}" class="btn btn-primary btn-xs" title="Add New Customer"><span class="glyphicon glyphicon-plus" aria-hidden="true"/></a></h1>
    <div class="table">
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>#</th><th> {{ trans('customer.name') }} </th><th> {{ trans('customer.addr') }} </th><th> {{ trans('customer.sex') }} </th><th> {{ trans('customer.created_at') }} </th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                {{-- */$x=0;/* --}}
                @foreach($customer as $item)
                {{-- */$x++;/* --}}
                <tr>
                    <td>{{ $x }}</td>
                    <td>{{ $item->name }}</td><td>{{ $item->addr }}</td>
                    <td>
                        @if ($item->sex == 1) 
                            男 
                        @elseif ($item->sex == 0) 
                            女 
                        @else 
                            未知 
                        @endif 
                    </td>
                    <td>{{ $item->created_at->format('Y-m-d') }}</td>
                    <td>
                        <a href="{{ url('/customer/' . $item->id) }}" class="btn btn-success btn-xs" title="View Customer"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"/></a>
                        <a href="{{ url('/customer/' . $item->id . '/edit') }}" class="btn btn-primary btn-xs" title="Edit Customer"><span class="glyphicon glyphicon-pencil" aria-hidden="true"/></a>
                        {!! Form::open([
                        'method'=>'DELETE',
                        'url' => ['/customer', $item->id],
                        'style' => 'display:inline'
                        ]) !!}
                        {!! Form::button('<span class="glyphicon glyphicon-trash" aria-hidden="true" title="Delete Customer" />', array(
                        'type' => 'submit',
                        'class' => 'btn btn-danger btn-xs',
                        'title' => 'Delete Customer',
                        'onclick'=>'return confirm("Confirm delete?")'
                        ));!!}
                        {!! Form::close() !!}
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        <div class="pagination"> {!! $customer->render() !!} </div>
    </div>

</div>
@endsection
