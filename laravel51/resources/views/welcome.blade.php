<!DOCTYPE html>
<html>
    <head>
        <title>Practical CSS3 tables with rounded corners - Laravel5 demo</title>
        <link href="{{url('/css/demo.css')}}" rel='stylesheet' type='text/css'>
    </head> 
    <body>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    @if (Auth::guest())
                    {{$authlogin}} &nbsp;  &nbsp; &nbsp;<a href="/authen/login">Login</a>
                      &nbsp; &nbsp; &nbsp;--  Laravel 5.1.39
                    @else                
                    欢迎&nbsp; {{Auth::user()->name}}  &nbsp; &nbsp; &nbsp; <a href="/auth/logout">Logout</a>  &nbsp; &nbsp; &nbsp;--  Laravel 5.1.35
                    @endif
                </li> 
            </ul>
        </div>
        <table class="bordered"> 

            <thead>   
                <tr>
                    <th>#</th>        
                    <th>标题</th>
                    <th>路由</th>
                    <th>描述</th>
                </tr>
            </thead>
            {{-- */$x=0;/* --}}
            @foreach ($list as $vo)
            {{-- */$x++;/* --}}
            <tr>
                <td>{{ $x }}</td>        
                <td>{{$vo->title}}</td>
                <td>{{$vo->route}}</td>
                <td><a href="{{ url($vo->route)}}">{{$vo->description}}</a></td>
            </tr>  
            @endforeach

        </table>

        <br><br> 
        <br>


    </body>
</html>
