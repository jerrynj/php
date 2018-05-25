@include('errors.errors')
<form action="{{ route('post.store')}}" method="POST">
    {{ csrf_field() }}
   
    <label class="col-md-4 control-label">标题</label>
    <input type="text" name="title"><br/><br/>
    <label class="col-md-4 control-label">内容</label>
    <textarea name="content" cols="50" rows="5"></textarea><br/><br/>
    <input type="submit" value="提交"/>  &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="取消"/>
</form>