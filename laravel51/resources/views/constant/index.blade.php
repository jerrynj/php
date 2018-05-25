<!DOCTYPE html>
<html>
    <head>
        <title>常量 - demo</title>
        <link href="{{url('/css/demo.css')}}" rel='stylesheet' type='text/css'>
    </head> 
    <body>

        <table class="bordered"> 

            <thead>   
                <tr>
                    <th>#</th>        
                    <th>常量</th>
                    <th>常量值</th>
                    <th>描述</th>
                </tr>
            </thead>

            {{-- */$x=0;/* --}}
            @foreach ($list as $vo)
            {{-- */$x++;/* --}}
            <tr>
                <td>{{ $x }}</td>        
                <td>{{$vo->title}}</td>
                <td>{{$vo->constant}}</td>
                <td>{{$vo->description}}</td>
            </tr>  
            @endforeach

            <tr>
                <td>{{ $x }}</td>        
                <td>locale常量 {{ session('user.name') }}</td>
                <td>{{ Config::get('app.locale') }}</td>
                <td>/conffig/app.php中locale常量</td>
            </tr> 
            <tr>
                <td>{{ $x }}</td>        
                <td>session常量 </td>
                <td>{{ session('user.name') }}</td>
                <td>Session常量</td>
            </tr> 
            <tr>
                <td>{{ $x }}</td>        
                <td>全局常量 </td>
                <td>{{ env('APP_DEBUG') }}</td>
                <td>APP_DEBUG常量</td>
            </tr> 
        </table>

        <br><br> 
        <br>


    </body>
</html>
