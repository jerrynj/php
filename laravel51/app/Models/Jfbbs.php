<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Jfbbs extends Model
{
    // 
    /**
    * 追加到模型数组表单的访问器
    *
    * @var array
    */
    protected $hidden = ['password'];

    protected $appends = ['detail','flag_at','is_admin'];

    public function getdetailAttribute(){
        $a = ['user'=>'xugp'.random_int(0,100),'topics'=>'2016科技故事','collects'=>'c'];
        return $this->attributes[] = $a;
    }   

    public function getFlagAtAttribute(){
        return $this->attributes[] = "FF";
    }
    public function getIsAdminAttribute()
    {
        return $this->attributes[] = 'yes';
    }


}
