<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Photo;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Session;

class PhotoController extends Controller
{
    /**
    * Display a listing of the resource.
    *
    * @return void
    */
    public function index()
    {
        $photo = Photo::paginate(15);

        return view('photo.index', compact('photo'));
    }

    /**
    * Show the form for creating a new resource.
    *
    * @return void
    */
    public function create()
    {
        return view('photo.create');
    }

    /**
    * Store a newly created resource in storage.
    *
    * @return void
    */
    public function store(Request $request)
    {
        $this->validate($request, 
            [
                'name' => 'required', 
                'status' => 'required_with:name|alpha_num',
                'email' => 'required_with:name', 
            ],
            //以下是手工补充的,模板生成时没有如下信息
            //add by xugp begin
            [
                'name' => '必须', 
                'status.required_with' => '当用户名存在时,状态字段必输',
                'email.required_with' => '当用户名存在时,邮件字段必输', 
            ]
            //add by xugp end
        );

        Photo::create($request->all());

        Session::flash('flash_message', 'Photo added!');

        return redirect('photo');
    }

    /**
    * Display the specified resource.
    *
    * @param  int  $id
    *
    * @return void
    */
    public function show($id)
    {
        $photo = Photo::findOrFail($id);

        return view('photo.show', compact('photo'));
    }

    /**
    * Show the form for editing the specified resource.
    *
    * @param  int  $id
    *
    * @return void
    */
    public function edit($id)
    {
        $photo = Photo::findOrFail($id);

        return view('photo.edit', compact('photo'));
    }

    /**
    * Update the specified resource in storage.
    *
    * @param  int  $id
    *
    * @return void
    */
    public function update($id, Request $request)
    {
        $this->validate($request, ['name' => 'required', 'status' => 'required_with:name|alpha_num', 'email' => 'required_with:name', ]);

        $photo = Photo::findOrFail($id);
        $photo->update($request->all());

        Session::flash('flash_message', 'Photo updated!');

        return redirect('photo');
    }

    /**
    * Remove the specified resource from storage.
    *
    * @param  int  $id
    *
    * @return void
    */
    public function destroy($id)
    {
        Photo::destroy($id);

        Session::flash('flash_message', 'Photo deleted!');

        return redirect('photo');
    }
}
