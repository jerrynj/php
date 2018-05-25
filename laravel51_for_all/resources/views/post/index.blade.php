@extends('layouts.app')

@section('content')
<div class="container">
    <div class="col-sm-offset-2 col-sm-8">    
        <div class="panel panel-default">
            <div class="col-sm-offset-3 col-sm-6">

                <a href="{{ url('/post/create')}}">Add Post</a> 

            </div>

            <div class="panel-body">
                <table class="table table-striped task-table">
                    <thead>
                        <th>#</th>
                        <th>标题</th>
                        <th>内容</th>
                        <th>&nbsp;</th>
                    </thead>
                    <tbody>
                        @foreach ($list as $vo)
                        <tr>
                            <td class="table-text"><div> </div></td>
                            <td class="table-text"><div><a href="{{ url('/post/show',['id'=>$vo->id, 'content'=>$vo->content])}}">{{ $vo->title }}</a></div></td>
                            <td class="table-text"><div>{{ $vo->content }}</div></td>

                            <!-- Task Delete Button -->
                            <td>

                                <a href="{{route('post.edit',['id'=>$vo->id])}}">修改</a> &nbsp;&nbsp;&nbsp;&nbsp;  
                                <a href="{{ url('/postdestory',['id'=>$vo->id])}}" title="软删除">删除</a>

                                <form action="/post/{{ $vo->id }}" method="POST">
                                    {{ csrf_field() }}
                                    {{ method_field('DELETE') }}

                                    <button type="submit" class="btn btn-danger" title="删除">
                                        <i class="fa fa-btn fa-trash"></i>
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
