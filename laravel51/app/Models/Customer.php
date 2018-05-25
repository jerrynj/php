<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;
use App\Models\BaseModel;

class Customer extends BaseModel
{
    //
//    protected $appends = ['sex1'];
                               
    public function getIsAdminAttribute()
    {
        return $this->attributes['admin'] == 'yes';
    }

    /**
    * TODO
    * 
    */
    public function getsex1Attribute(){
       $status = $this->sex;              
        if ($status == '1') {
            return '男';
        }  else if ($status == '0') {            
            return '女';
        }    else {
            return '未知';            
        }
       
    }  
}
