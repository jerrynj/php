<?php
namespace App\Repositories\Criteria\Post;

use Bosnadev\Repositories\Criteria\Criteria;
use Bosnadev\Repositories\Contracts\RepositoryInterface as Repository;

class Status extends Criteria {

    /**
     * @param $model
     * @param RepositoryInterface $repository
     * @return mixed
     */
    public function apply($model, Repository $repository)
    {
        $model = $model->where('id', '<', 1000);
        return $model;
    }
    
    
     public function aaa($model, Repository $repository)
    {
        $model = $model->where('id', '>', 3);
        return $model;
    }
}