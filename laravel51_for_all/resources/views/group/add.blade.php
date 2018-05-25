@extends('app') 
@section('content')
<div class="container">
    <div class="col-sm-offset-2 col-sm-8">
        <div class="panel panel-default">
            <div class="panel-heading">
                Add Group
            </div>

            <div class="panel-body">
                <!-- Display Validation Errors -->

                   @include('errors.errors')
                   
                <!-- New Task Form -->
                <form action="{{ url('group')}}" method="POST" class="form-horizontal">
                    {{ csrf_field() }}

                    <!-- Task Name -->
                    <div class="form-group">
                        <label for="group-name" class="col-sm-3 control-label">组名</label>

                        <div class="col-sm-6">          
                            <input type="text" name="title" id="title" class="form-control" value="">
                        </div>
                    </div>
                   
                    <div class="form-group">
                        <label for="group-name" class="col-sm-3 control-label">状态</label>
                        <div class="col-sm-6">
                            <select name="status" id="status">
                                <option value="1" selected="">启用</option>
                                <option value="0">禁用</option>
                            </select>
                        </div>
                    </div>
                    <!-- Add Task Button -->
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-6">
                            <button type="submit" class="btn btn-default">
                                <i class="fa fa-btn fa-plus"></i>保存
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>            
    </div>
</div>
@endsection
