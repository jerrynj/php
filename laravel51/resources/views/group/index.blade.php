@extends('app')  
@section('content')
<div class="container">
    <div class="col-sm-offset-2 col-sm-8">    
        <div class="panel panel-default">
         <div class="col-sm-offset-3 col-sm-6">
                
                    <a href="{{ url('/group/add')}}">增加</a> 
                
            </div>
            <div class="panel-heading">
                Current Group
            </div>

            <div class="panel-body">
                <table class="table table-striped task-table">
                    <thead>
                        <th>#</th>
                        <th>组名</th>
                        <th>&nbsp;</th>
                    </thead>
                    <tbody>
                        @foreach ($list as $vo)
                        <tr>
                            <td class="table-text"><div> </div></td>
                            <td class="table-text"><div><a href="{{ url('/group',['id'=>$vo->id])}}">{{ $vo->title }}</a></div></td>

                            <!-- Task Delete Button -->
                            <td>
                                <form action="/group/{{ $vo->id }}" method="POST">
                                    {{ csrf_field() }}
                                    {{ method_field('DELETE') }}
                                     <button type="submit" class="btn btn-danger" title="删除">
                                        <i class="fa fa-btn fa-trash"></i> 删除
                                    </button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
       
    </div>
</div>
@endsection
