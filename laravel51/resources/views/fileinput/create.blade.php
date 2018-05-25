
@section('scripts')
<link href="{{url('/fi/bootstrap/css/bootstrap.min.css')}}" rel='stylesheet' type='text/css'>
<link href="{{url('/fi/bootstrap/css/default.css')}}" rel='stylesheet' type='text/css'>
<link href="{{url('/fi/bootstrap/css/fileinput.css')}}" rel='stylesheet' type='text/css'>

<script src="{{url('/fi/bootstrap/js/fileinput.min.js')}}"></script>
<script src="{{url('/fi/bootstrap/js/bootstrap.min.js')}}"></script>
<script src="{{url('/fi/js/locales/zh.js')}}"></script>

@stop
<div class="container">

    <h1>Create New Fileinput</h1>
    <hr/>

    {!! Form::open(['url' => '/fileinput', 'class' => 'form-horizontal', 'enctype'=>'multipart/form-data']) !!}

    <div class="form-group {{ $errors->has('url') ? 'has-error' : ''}}">
        {!! Form::label('url', 'Url', ['class' => 'col-sm-3 control-label']) !!}
        <div class="col-sm-6">
            {!! Form::text('url', null, ['class' => 'form-control']) !!}
            {!! $errors->first('url', '<p class="help-block">:message</p>') !!}
        </div>
    </div>
    <div class="form-group {{ $errors->has('desc') ? 'has-error' : ''}}">
        {!! Form::label('desc', 'Desc', ['class' => 'col-sm-3 control-label']) !!}
        <div class="col-sm-6">
            {!! Form::textarea('desc', null, ['class' => 'form-control']) !!}
            {!! $errors->first('desc', '<p class="help-block">:message</p>') !!}
        </div>
    </div>

    <div class="form-group">
        <label>文件1-显示预览</label>
        <input id="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="1">  
    </div>

    <div class="form-group">
        <label>文件2-不显示预览</label>
        <input id="file-2" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="1"data-show-preview="false"> 
    </div>

    <div id="errorBlock" class="help-block"></div> 


    <div class="space-4"></div>


    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-3">
            {!! Form::submit('Create', ['class' => 'btn btn-primary form-control']) !!}
        </div>
    </div>
    {!! Form::close() !!}

    @if ($errors->any())
    <ul class="alert alert-danger">
        @foreach ($errors->all() as $error)
        <li>{{ $error }}</li>
        @endforeach
    </ul>
    @endif

</div>

<script>
    $("#file-1").fileinput({
        language: 'zh', //设置语言
        uploadUrl: "{:U('upload')}", // you must set a valid URL here else you will get an error
        allowedFileExtensions : ['jpg', 'png','gif','txt'],
        overwriteInitial: false,
        maxFileSize: 1000,
        maxFilesNum: 10,
        //allowedFileTypes: ['image', 'video', 'flash'],
        elErrorContainer: "#errorBlock",
        slugCallback: function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    })
    .on("filebatchselected", function(event, files) {
        // $(this).fileinput("upload");
    })
    //这是提交完成后的回调函数    
    .on("fileuploaded", function(event, data, previewId, index) {
        if(data.status=='0'){ //上传成功
            $("#file-1").html(data.info);
        }else {  //上传失败
            $("#errorBlock").html(data.info);                    
        }


    });

    $("#file-2").fileinput({
        language: 'zh', //设置语言
        uploadUrl: "{:U('upload')}", // you must set a valid URL here else you will get an error
        allowedFileExtensions : ['jpg', 'png','gif','txt'],
        overwriteInitial: false,
        maxFileSize: 1000,
        maxFilesNum: 10,
        //allowedFileTypes: ['image', 'video', 'flash'],
        elErrorContainer: "#errorBlock",
        slugCallback: function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    })
    .on("filebatchselected", function(event, files) {
        // $(this).fileinput("upload");
    })
    //这是提交完成后的回调函数    
    .on("fileuploaded", function(event, data, previewId, index) {
        if(data.status=='0'){ //上传成功
            $("#errorBlock").html(data.info);
        }else {  //上传失败
            $("#errorBlock").html(data.info);                    
        }


    });
</script>
