<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;

use App\Models\Post;
use App\Repositories\PostRepository as Repository; 
use App\Repositories\Criteria\Post\Status;

class PostController extends Controller
{
    private $model;
    public function __construct(Repository $rep) {

        $this->model = $rep;
    }
    /**
    * Display a listing of the resource.
    *
    * @return Response
    */
    public function index()
    {
        $posts = Post::orderBy('updated_at', 'desc')->get(); 

        return view('post.index', ['list'=>$posts]);
    }

    /**
    * Show the form for creating a new resource.
    *
    * @return Response
    */
    /**
    * 创建新文章表单页面
    *
    * @return Response
    */
    public function create()
    {
        $flag = 1;
        if (!$flag) {
            $postUrl = route('post.store');
            $csrf_field = csrf_field();
            $html = <<<CREATE
        <form action="$postUrl" method="POST">
            $csrf_field
            <input type="text" name="title"><br/><br/>
            <textarea name="content" cols="50" rows="5"></textarea><br/><br/>
            <input type="submit" value="提交"/>
        </form>
CREATE;
            return $html;    
        }else {
            return view('post.create');  
        }

    }

    /**
    * Store a newly created resource in storage.
    *
    * @param  Request  $request
    * @return Response
    */
    public function store(Request $request)
    {

        $this->Valide($request);

        $data = Input::all();
        $title = Input::get('title');

        $post = new Post;
        $post->title = $request->input('title');
        $post->content = $request->input('content');
        //var_dump($post);
        $ret = $post->save();
        if ($ret) {
            return redirect('/post')->with('status', '操作成功！)'); 
        } else {
            return redirect()->back()->withInput()->withErrors('操作失败！');
        }
    }

    /**
    * Display the specified resource.
    *
    * @param  int  $id
    * @return Response
    */
    public function show($id)
    {
        //
    }

    /**
    * Show the form for editing the specified resource.
    *
    * @param  int  $id
    * @return Response
    */
    public function edit($id)
    {    
        $post = Post::find($id);
        return view('post.edit', ['vo'=>$post]);
    }

    /**
    * Update the specified resource in storage.
    *
    * @param  Request  $request
    * @param  int  $id
    * @return Response
    */
    public function update(Request $request, $id)
    {

        $this->Valide($request);
        $data = Input::all();
        $d['title'] = $request->input('title');
        $d['content'] = $request->input('content');
        $ret = Post::where('id', $id)->update($d);
        //判断，如果通过验证，那么第一步跳转到config页面，并且显示成功          
        //附带flash消息的跳转：
        if ($ret) {
            return redirect('/post')->with('status', '操作成功！)'); 
        } else {
            return redirect()->back()->withInput()->withErrors('操作失败！');
        }
    }

    /**
    * Remove the specified resource from storage.
    *
    * @param  int  $id
    * @return Response
    * 软删除
    */
    public function destroy($id)
    {
        $ret = Post::destroy($id);
        //$ret = Post::where('id', $id)->update(['status'=>0]);
        //判断，如果通过验证，那么第一步跳转到config页面，并且显示成功          
        //附带flash消息的跳转：
        if ($ret) {
            return redirect('/post')->with('status', '操作成功！)'); 
        } else {
            return redirect()->back()->withInput()->withErrors('操作失败！');
        }
    }

    public function test()
    { 
        //        $data = Post::find(1);
        //        $data = $this->pr->all();
        //        $data = $this->pr->find(2, ['id', 'title','content']);
        $st = new Status;
        $this->model->pushCriteria($st);
//        $data = $this->model->all();
       // $data = $this->model->findBy('content', '9',['id', 'title','content']);
//        $data = $this->model->findAllBy('content', '9',['id', 'title','content']);
        $data = $this->model->findWhere(['id'=>'2',['user_id','<',16]],['id', 'title','content']);
//        dd($data);
        return view('group.index', ['list'=>$data]);
        //return response()->json($data);
    }

    private function Valide(Request $request) {
        $this->validate($request, [
            'title' => 'required|unique:posts|min:3|max:255',
            'content' => 'required',
        ]);
    }
}
