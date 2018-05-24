<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Task;

class TaskController extends Controller
{
    public function index() {
        //$list = Task::orderBy('created_at', 'asc')->get();
        // $list = Task::all();
        //        return view('tasks', ['tasks' => $list]);
        return view('tasks', [
            'tasks' => Task::orderBy('created_at', 'asc')->get()
        ]);

    }

}
