<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use App\Model\BaseModel;

class Task extends Model
{
    protected $fillable = ['name'];
}
