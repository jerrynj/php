<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\CustomerRequest;
use App\Http\Controllers\Controller;
use App\Models\Customer;

class CustomerController extends Controller
{
    /**
    * Display a listing of the resource.
    *
    * @return \Illuminate\Http\Response
    */
    public function index()
    {
        $customer = Customer::paginate(15);
        return view('customer.index', compact('customer'));
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
    public function store(CustomerRequest $request)
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
    public function update(CustomerRequest $request, $id)
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

    /**
    * 获取枚举值
    * 
    */
    protected function getSexList() {
        $data = array('1' => '男', '0' => '女') ;
        return $data;
    }

    protected function getSex($sex) {
        $ret = '男';
        if ($sex == 0)    {
            $ret = '女';
        }
        return $ret;
    }
}
