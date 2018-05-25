<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use Session;

class SessionController extends Controller
{
    /**
    * Display a listing of the resource.
    *
    * @return \Illuminate\Http\Response
    */
    public function index()
    {


        session(['user.id'=>'10001']);      //设置Session          
        session(['user.name'=>'Admin']);      //设置Session    
        Session::put('user.a01','b01');         //设置Session    
        Session::put('user.a02','b02');  
        Session::flash('user.flash','flash');
        
        //        Session::push('user.a0x','b0x');

        Session::push('user.a0x',['b02x','b03x','b04x']);        


        Session::flash('user.a09','b09');      //存放一次性Session
        
        session()->keep(['user.a09']);
//        dd(session('user'));
        
        $lists = session('user');
       
//        dd($lists);
        return view('session.index', compact('lists'));
    }

    public function getSession(){
//        dd(session('user.a09'));
         
        Session::pull('user.a01');  //获取并删除Session
        $lists = session('user');
        //        dd(Session::get('user.id'));
//        dd(session());
        return view('session.index', compact('lists'));
    }

    public function flushSession() {
        Session::flush();
        $lists = session('user');
        return view('session.index', compact('lists'));
    }

    /**
    * Show the form for creating a new resource.
    *
    * @return \Illuminate\Http\Response
    */
    public function create()
    {
        //
    }

    /**
    * Store a newly created resource in storage.
    *
    * @param  \Illuminate\Http\Request  $request
    * @return \Illuminate\Http\Response
    */
    public function store(Request $request)
    {
        $s = $request->session()->all(); //获取所有Session
        $request->session()->put('sitename','Test corp. Site');       //设置session


    }

    /**
    * Display the specified resource.
    *
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
    public function show($id)
    {
        //
    }

    /**
    * Show the form for editing the specified resource.
    *
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
    public function edit($id)
    {
        //
    }

    /**
    * Update the specified resource in storage.
    *
    * @param  \Illuminate\Http\Request  $request
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
    public function update(Request $request, $id)
    {
        //
    }

    /**
    * Remove the specified resource from storage.
    *
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
    public function destroy($id)
    {
        //
    }
}
