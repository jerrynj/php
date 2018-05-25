<?php

Route::get('/demos', function () {
    $list = App\Models\Demo::all();
    return view('demos', ['list' => $list]);
});

Route::get('/test/child', function() {
    session(['user.name'=>'jerryxu0909','user.id'=>'0']);

    return view('test.child', ['name'=>'<li>Jerry</li>']);
});

Route::group(['middleware'=>'mw'],function(){
    Route::get('/test/mw',function(){
        return "成年人可以入内！";
    });
});
Route::get('/test/mw1',['as'=>'refuse',function(){
    return "未成年人禁止入内！";
}]);

Route::resource('/test/session','SessionController');
Route::resource('/test/session1','SessionController@getSession');
Route::resource('/test/flush','SessionController@flushSession');

//内连接(查询交集)
Route::get('/article','ArticleController@index');

//常量
Route::get('/constant', function() {
    session(['user.name'=>'jerryxu0909','user.id'=>'0']);
    $list =  \App\Models\Constant::all();
    return view('constant.index', ['list' => $list]);
});
Route::resource('/article/join','ArticleController@getJoin');
Route::resource('/article/leftjoin','ArticleController@leftJoin');
Route::resource('/article/rightjoin','ArticleController@rightJoin');
Route::resource('/article/outerjoin','ArticleController@outerJoin');





Route::get('/hello/laravelacademy/{id}',['as'=>'academy',function($id){
    return 'Hello LaravelAcademy '.$id.'！';
}]);
Route::get('/testNamedRoute1',function(){
    return redirect()->route('academy',['id'=>1]);
});


Route::get('posts/{post}/comments/{comment}', function ($postId, $commentId) {
    return 'Hello post:'.$postId.' comments:'.$commentId.' ！';
});


Route::get('/testNamedRoute2',function(){
    return route('admin::dashboard');
    //return "<a href='route('admin::dashboard')'>route('admin::dashboard')</a>";
});

Route::group(['as' => 'admin::'], function () {
    Route::get('dashboard', ['as' => 'dashboard', function () {
        return "这个是复杂的路由分组 admin::dashboard";
    }]);
});


Route::get('/api/index', function() {    
    $model = new \App\Models\Jfbbs();
    $list = $model::all();

    return response()->json($list);
});
Route::get('/api/user/userinfo', function() {    
    $model = new \App\Models\Userinfo();
    $list = $model::all();
    return response()->json($list);
});

//原生SQL
Route::Resource('/article','ArticleController');
Route::Resource('/customer', 'CustomerController');
Route::Resource('/order', 'OrderController');



