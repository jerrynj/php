<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Models\BaseModel;

class Log extends BaseModel
{
    protected $appends = ['status1'];
    /**
    * The database table used by the model.
    *
    * @var string
    */
    protected $table = 'qw_log';

    /**
    * The database primary key value.
    *
    * @var string
    */
    protected $primaryKey = 'id';

    /**
    * Attributes that should be mass-assignable.
    *
    * @var array
    */
    protected $fillable = ['uid', 'name', 't', 'ip', 'log', 'url'];
    protected $hidden = ['created_at','updated_at','deleted_at'];
    //不再处理'created_at','updated_at','deleted_at'
    
    
  public function getstatus1Attribute(){
        $status = $this->status; 
              
        if ($status == '1') {
            return '正常';
        }  else if ($status == '0') {            
            return '删除';
        }
     
    }  
}
