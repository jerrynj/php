<!DOCTYPE html>
<html>
    <head>
        <title>DB连接查询 - demo</title>
        <link href="{{url('/css/demo.css')}}" rel='stylesheet' type='text/css'>
    </head> 
    <body>
       
        <table class="bordered"> 

            <thead>   
                <tr>
                    <th>#</th>        
                    <th>标题</th>
                    <th>描述</th>
                </tr>
            </thead>
            <tr>
                <td>1</td>                      
                <td><a href="{{ url('/article/join')}}">内连接</a></td>
                <td></td>
            </tr> 
             <tr>
                <td>2</td>                      
                 <td><a href="{{ url('/article/leftjoin')}}">左连接</a></td>
                <td></td>
            </tr> 
             <tr>
                <td>3</td>                      
                 <td><a href="{{ url('/article/rightjoin')}}">右连接</a></td>
                <td></td>
            </tr> 
             <tr>
                <td>4</td>                      
                 <td></td>
                <td></td>
            </tr> 
        </table>

        <br><br> 
        <br>


    </body>
</html>
