<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Log;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Session;
use Validator;
use DB; 

class LogController extends Controller
{
    /**
    * Display a listing of the resource.
    *
    * @return void
    */
    public function index()
    {
        $log = Log::paginate(15);

        return view('log.index', compact('log'));
    }

    /**
    * Show the form for creating a new resource.
    *
    * @return void
    */
    public function create()
    {
        return view('log.create');
    }

    /**
    * Store a newly created resource in storage.
    *
    * @return void
    */
    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'url' => 'required|min:3|max:255',
        ]);

        if ($validator->fails()) {
            return redirect('log/create')
            ->withErrors($validator)
            ->withInput();
        }
        Log::create($request->all());

        Session::flash('flash_message', 'Log added!');

        return redirect('log');
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
        $log = Log::findOrFail($id);
        $lists = DB::table('qw_setting')->get();

        return view('log.show', compact('log'));
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
        $log = Log::findOrFail($id);
        $lists = DB::table('qw_setting')->get();
        $dropdownlist = $this->getDropdownlist();
       
        //return view('log.edit', ['log'=>$log, 'lists'=>$lists, 'dropdownlist'=>$this->getDropdownlist()]);
        //或者下面这个也可以
        return view('log.edit', compact('log', 'lists', 'dropdownlist'));
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

        $log = Log::findOrFail($id);
        $log->update($request->all());

        Session::flash('flash_message', 'Log updated!');

        return redirect('log');
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
        Log::destroy($id);

        Session::flash('flash_message', 'Log deleted!');

        return redirect('log');
    }
    
    /**
    * 获取枚举值
    * 
    */
    protected function getDropdownlist() {
        $data = array('1' => 'YES', '0' => 'NO','2'=>'All') ;
        return $data;
    }
}
