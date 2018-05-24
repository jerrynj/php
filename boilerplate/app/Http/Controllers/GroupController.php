<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
//use App\Http\Controllers\Auth\Validator;
use Validator;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Model\Group;

use Illuminate\Support\Facades\Input;

class GroupController extends Controller
{
    public function index(){
        $group = Group::all();
        return view('group.index', [
            'list' => $group
        ]); 

    }
    public function add(){

        return view('group.add'); 

    }
    public function edit($id){  
        $group = Group::find($id);
        return view('group.edit', [
            'vo' => $group
        ]); 

    }
    public function delete($id){
        $group = Group::find($id);  
        $group->status = "0";    
        $ret = $group->save();  

        // $group = Group::all();     
        //        return view('group.index', [
        //            'list' => $group
        //        ]);

        //判断，如果通过验证，那么第一步跳转到config页面，并且显示成功          
        //附带flash消息的跳转：
        if ($ret) {
            return redirect('/group')->with('status', '删除成功！)'); 
        } else {
            return redirect()->back()->withInput()->withErrors('删除失败！');
        }

    }

    public function store(Request $request) {
        $validator = validator($request->all(), [
            'title' => 'required|max:10',
        ]);

        if ($validator->fails()) {
            return redirect('/group')
            ->withInput()
            ->withErrors($validator);
        }

        $id = Input::get("id");
        $title = Input::get("title");  
        if (!isset($id)) {
            $group = new Group;
            $group->title = $title;
            $ret = $group->save();
        }   else {
            $ret = Group::where('id', $id)->update(["title" => $title]);
        }
        //判断，如果通过验证，那么第一步跳转到config页面，并且显示成功          
        //附带flash消息的跳转：
        if ($ret) {
            return redirect('/group')->with('status', '操作成功！)'); 
        } else {
            return redirect()->back()->withInput()->withErrors('操作失败！');
        }
    }
}
