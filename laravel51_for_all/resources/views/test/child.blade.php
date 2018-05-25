<!-- Stored in resources/views/child.blade.php -->

@extends('layouts.master')

@section('title')
    
Child Page Title--1
@stop

@section('sidebar')
    @parent
    <br>===<br>

    <p>This is child appended to the master sidebar.</p>
@stop

@section('content')
    <p>This is child body content.</p>
=================

<h5> 不转义: </h5><br/> {!! $name or 'Xugp' !!}  <br/>
<h5> 转义(默认): </h5><br/> {{  $name or 'Xugp' }}   <br/>
=================
{{ config('app.key') }}
<li>{!! session('user.name') !!}</li>

<li>{!! session('a1') !!}</li>
<li>{!! session('a2') !!}</li>

@stop

<h1>Laravel</h1>




