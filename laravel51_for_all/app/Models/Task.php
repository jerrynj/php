<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Model\BaseModel;

class Task extends Model
{
    protected $fillable = ['name'];
}
