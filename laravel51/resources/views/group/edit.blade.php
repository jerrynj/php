@extends('app')

@section('content')
    <div class="container">
        <div class="col-sm-offset-2 col-sm-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Edit Group
                </div>

                <div class="panel-body">
                  
                    <!-- New Task Form -->
                    <form action="{{ url('/group')}}" method="POST" class="form-horizontal">
                        {{ csrf_field() }}    
                        <input type="hidden" id="gid" name="gid" value="{{$vo->id}}" /> 
                        <div class="form-group">
                            <label for="task-name" class="col-sm-3 control-label">Group ID</label>

                            <div class="col-sm-6">
                                <input type="text" name="id" id="id" class="form-control" value="{{ $vo->id }}" readonly>
                            </div>
                        </div><!-- Task Name -->
                        <div class="form-group">
                            <label for="group-name" class="col-sm-3 control-label">Group Name</label>

                            <div class="col-sm-6">
                                <input type="text" name="title" id="title" class="form-control" value="{{ $vo->title }}">
                            </div>
                        </div>

                        
                        <!-- Add Task Button -->
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-6">
                                <button type="submit" class="btn btn-default">
                                    <i class="fa fa-btn fa-plus"></i>Save
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>            
        </div>
    </div>
@endsection
