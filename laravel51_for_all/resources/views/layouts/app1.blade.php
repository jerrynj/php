<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel Quickstart - Basic</title>

        <!-- Fonts -->
        <link href="{{url('/css/font-awesome.min.css')}}" rel='stylesheet' type='text/css'>
        <!--link href="/css/font-awesome.min.css" rel='stylesheet' type='text/css'-->
        <link href="{{url('https _fonts.googleapis.com_css',['family=Lato:100,300,400,700'])}}" rel='stylesheet' type='text/css'>

        <!-- Styles -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <!--link href="{{url('css/bootstrap.min.css')}}" rel="stylesheet"-->
        {{-- <link href="{{ elixir('css/app.css') }}" rel="stylesheet"> --}}

        <style>
            body {
                font-family: 'Lato';
            }

            .fa-btn {
                margin-right: 6px;
            }
        </style>
    </head>
    <body id="app-layout">
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">

                    <!-- Branding Image -->
                    <a class="navbar-brand" href="{{ url('/') }}">
                        List
                    </a>
                </div>

            </div>
        </nav>

        @yield('content')

        <!-- JavaScripts -->
        <script src="/js/jquery-2.1.4.min.js"></script>
        <script src="/js/bootstrap.min.js"></script>
        {{-- <script src="{{ elixir('js/app.js') }}"></script> --}}
    </body>
</html>
