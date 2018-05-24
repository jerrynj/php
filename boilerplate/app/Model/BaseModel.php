<?php

namespace App\Model;

use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Scopes\StatusScope;
use Illuminate\Database\Eloquent\Model;

class BaseModel extends Model
{  
     protected static function boot()
    {
        parent::boot();

        static::addGlobalScope(new StatusScope);
    }

}
