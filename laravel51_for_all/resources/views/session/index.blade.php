@extends('layouts.app')

@section('content')
<div class="container">

    <h1>Session</h1>
    <a href="{{ url('/test/session') }}">初始Session</a> &nbsp; &nbsp;&nbsp;&nbsp;
    <a href="{{ url('/test/session1') }}">获取Session</a> &nbsp; &nbsp;&nbsp;&nbsp;
    <a href="{{ url('/test/flush') }}">清空Session</a> &nbsp; &nbsp;&nbsp;&nbsp;
    <div class="table">
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>#</th><th> Key </th><th> Value </th><th> Size </th>
                </tr>
            </thead>
            <tbody>
                @if (count($lists) > 0)
                    {{-- */$x=0;/* --}}
                    @foreach($lists as $k=>$v)
                        {{-- */$x++;/* --}}
                         @if (is_array($v))
                            @foreach($v as $k1=>$v1)
                            <tr>
                                <td>{{ $x }}</td>
                                <td>{{ $k1 }}</td>
                                <td>{!! is_array($v1)? '-':$v1 !!}</td> 
                                <td>{!! count($v1) !!}</td>
                            </tr>
                            @endforeach
                        @else
                            <tr>
                                <td>{{ $x }}</td>
                                <td>{{ $k }}</td>
                                <td>{!! $v !!}</td> 
                                 <td>{!! count($v) !!}</td>
                            </tr>
                    @endif 
                    @endforeach
                @endif
            </tbody>
        </table>

    </div>


</div>
@endsection
