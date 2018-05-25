<?php

namespace App\Http\Controllers\Auth;

use Validator;
use Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;

use Illuminate\Support\Facades\Input;

/**
* 通过用户名登录
*/
class AuthenController extends Controller
{
    //默认1分钟只能登录5交次
    use AuthenticatesAndRegistersUsers, ThrottlesLogins;

    protected $redirectPath = '/home';
    protected $loginPath = '/login';

    public function getLogin()
    {
        if (view()->exists('auth.authenticate')) {
            return view('auth.authenticate');
        }

        return view('auth.loginen');
    }
    /**
    * 处理登录认证
    *
    * @return Response
    */
    public function authenticate()
    {
        $data['name'] = Input::get("name");
        $data['password'] = Input::get("password");   
        
        //$throttles = $this->isUsingThrottlesLoginsTrait();
//        if ($throttles && $this->hasTooManyLoginAttempts()){
//            return $this->sendLockoutResponse($request);
//        }
        
        if (Auth::once($data)){
            //
        }
        

        if (Auth::attempt(['name' => $data['name'], 'password' => $data['password'], 'status'=>1])) {
            // 认证通过...
            return redirect()->intended("/home");
        }   else {
            return redirect()->back()->withInput()->withErrors('用户名或密码错误！');
        }
    }

}
