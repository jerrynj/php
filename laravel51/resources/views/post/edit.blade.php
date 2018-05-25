@include('errors.errors')
<form action="{{ route('post.update', ['id'=>$vo->id])}}" method="POST">
    {{ csrf_field() }}
    {{ method_field('PUT') }}
    <input type="text" name="title" value="{{$vo->title}}"><br/><br/>
    <textarea name="content" cols="50" rows="5">{{$vo->content}}</textarea><br/><br/>
    <input type="submit" value="提交"/>  &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="取消"/>
</form>