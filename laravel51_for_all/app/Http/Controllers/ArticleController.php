<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;


class ArticleController  extends Controller
{
    //protected $table = 'qw_article';
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   
       return view('article.index');
    }
    
    //内连接(交集)
    public function getJoin()
    {   
        $list = DB::table('qw_article')->join('users', 'users.id','=', 'qw_article.sid')
        ->select('users.id', 'users.name','qw_article.title', 'qw_article.keywords')->get();
        return response()->json($list);                                     
    }
    
    public function leftJoin() {
       $list = DB::table('qw_article')->leftjoin('users', 'users.id','=', 'qw_article.sid')
       ->select('users.id', 'users.name','qw_article.title', 'qw_article.keywords')->get();
       return response()->json($list);          
   } 
    public function rightJoin() {
       $list = DB::table('qw_article')->rightjoin('users', 'users.id','=', 'qw_article.sid')
       ->select('users.id', 'users.name','qw_article.title', 'qw_article.keywords')->get();
       return response()->json($list);          
   }
   /**
   * 有问题
   * 
   */
   public function outerJoin() {
       $list = DB::table('qw_article')->outterjoin('users', 'users.id','=', 'qw_article.sid')
       ->select('users.id', 'users.name','qw_article.title', 'qw_article.keywords')->get();
       return response()->json($list);          
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
        //
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
