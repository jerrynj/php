<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| This route group applies the "web" middleware group to every route
| it contains. The "web" middleware group is defined in your HTTP
| kernel and includes session state, CSRF protection, and more.
|
*/

use App\Model\Task;
use App\Model\User;
use Illuminate\Http\Request;

Route::group(['middleware' => ['web']], function () {
    /**
    * Show Task Dashboard
    */
    Route::get('/', function () {
        return view('tasks', [
            'tasks' => Task::orderBy('created_at', 'asc')->get()
        ]);
    });



    /**
    * Add New Task
    */
    Route::post('/task', function (Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:255',
        ]);

        if ($validator->fails()) {
            return redirect('/')
            ->withInput()
            ->withErrors($validator);
        }

        $task = new Task;
        $task->name = $request->name;
        $task->save();

        return redirect('/');
    });

    /**
    * Delete Task
    */
    Route::delete('/task/{id}', function ($id) {
        Task::findOrFail($id)->delete();

        return redirect('/');
    });
});




Route::get('foo', function () {
    return 'Hello World';
});


Route::get('/profile', ['as' => 'profile', function () {
    return  'user/profile =>'.route('profile');
}]);

//Route::group(['as' => 'admin::'], function () {
//    Route::get('dashboard', ['as' => 'dashboard', function () {
//        // 路由被命名为 admin::dashboard
//        return "路由被命名为 admin::dashboard =>".route('admin::dashboard');;
//    }]);
//});

Route::group(['prefix' => 'admin'], function () {
    Route::get('users', function () {
        return  '匹配 prefix/users';
    });
});


Route::group(['prefix' => 'accounts/{account_id}'], function () {
    Route::get('detail', function ($account_id) {
        // 匹配 accounts/{account_id}/detail URL
        return "匹配 accounts/{account_id}/detail URL";
    });
});

Route::get('api/users/{user}', function (App\User $user) {
    return $user->email;
});

//===============================================
$router->bind('u/1', function($value) {
    return App\User::where('id', $id)->first();
});



//http://localhost/p
Route::resource('/p', 'PhotoController');


Route::get('/t', function () {
    $task = new App\Task;
    $tasks = $task::orderBy('created_at', 'asc')->get();

    return view('tasks', [
        'tasks' => $tasks
    ]);
});


Route::get('/user', function () {
    $user = new App\User;
    $list = $user::orderBy('created_at', 'asc')->get();

    return response()->json($list);
});


Route::get('/ti', 'TaskController@index');
Route::get('/group', 'GroupController@index');
Route::get('/group/add', 'GroupController@add');
Route::delete('/group/{id}', 'GroupController@delete');
Route::get('/group/{id}', 'GroupController@edit');
Route::post('/group', 'GroupController@store') ;


