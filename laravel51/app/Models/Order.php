<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public $table = 'qw_log';
    public $primaryKey = 'id';
    public $timestamps = false;
    protected $dateFormat = 'U';
}
