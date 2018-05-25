<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Order;

class Member extends BaseModel
{
    //    protected $table = 'qw_member';
    public $timestamps = false;
    protected $dateFormat = 'U';

    protected $hidden = ['created_at', 'updated_at', 'deleted_at','email','first_name',];
    //protected $appends = ['Flag_At'];
    protected $appends = ['detail','flag_at','is_admin', 'Order'];

    //显示哪些字段
    //protected $visible = ['first_name', 'last_name'];


    public function getdetailAttribute(){
        $a = ['user'=>'xugp'.random_int(0,100),'topics'=>'2016科技故事','collects'=>'c'];
        return $this->attributes[] = $a;
    }   
    public function getOrderAttribute(){
        $order = Order::select('id','uid')->where('id','1')->get();
        return $this->attributes['order'] = $order;
    }   

    public function getFlagAtAttribute(){
        return $this->attributes[] = "FF";
    }
    public function getIsAdminAttribute()
    {
        return $this->attributes[] = 'yes';
    }
    /**
    * 应该被转化为原生类型的属性
    *
    * @var array
    */
    protected $casts = [
        'options' => 'array',
    ];


    public function json(){
        //方法1，获取json
        $list = $this->orderBy('name', 'desc')->get();       
        $jsonlist = $list->toJson();

        //方法2，获取json
        $jsonlist = response()->json($list);

        //方法3，获取json
        $jsonlist = (String) $list;
        return $jsonlist;
    }

}
