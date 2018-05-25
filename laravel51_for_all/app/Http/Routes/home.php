<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/


//Group相关=====================
Route::get('/group', 'GroupController@index');
Route::get('/group/add', 'GroupController@add');
Route::delete('/group/{id}', 'GroupController@delete');
Route::get('/group/{id}', 'GroupController@edit');
Route::post('/group', 'GroupController@store') ;

//创建RESTFul风格的路由控制器
Route::resource('post', 'PostController'); 
//以下为软删除
Route::get('/postdestory/{id}', 'PostController@destroy');  
Route::get('/posttest', 'PostController@test');

//Member相关RESTFul风格的路由控制器
Route::resource('member', 'MemberContorller');

//无状态的HTTP基本认证
Route::get('api/user', ['middleware' => 'Illuminate\Auth\Middleware\AuthenticateWithBasicAuth', function() {
    return "无状态的HTTP基本认证";
}]);

Route::resource('log', 'LogController');
