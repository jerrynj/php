<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;
use App\Http\Controllers\Auth;

class MemberRequest extends Request
{
    /**
    * Determine if the user is authorized to make this request.
    *
    * @return bool
    */
    public function authorize()
    {
        return Auth::check();
        //return false;
    }

    /**
    * 获取应用到请求的验证规则
    *
    * @return array
    */
    public function rules(){
        return [
            'user' => 'required|unique:posts|min:2|max:8',
            //        'body' => 'required',
        ];
    }
}
