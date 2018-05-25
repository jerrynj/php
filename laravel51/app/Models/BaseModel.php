<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Scopes\StatusScope;
use Illuminate\Database\Eloquent\Model;

class BaseModel extends Model
{  
    public $timestamps = true;
    
     protected static function boot()
    {
        parent::boot();

        static::addGlobalScope(new StatusScope);
    }
    
     public function freshTimestamp()
    {
        return time();
    }
    
    public function fromDateTime($value)
    {  return $value;
    }
    
    function getDateformat() {       
        return 'U';
    }

}
