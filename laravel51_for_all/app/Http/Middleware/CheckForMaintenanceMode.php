<?php

namespace App\Http\Middleware;

use Closure;

class CheckForMaintenanceMode
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        //维护状态下，白名单IP可以访问
        if ($this->app->isDownForMaintenance() &&
        !in_array($request->getClientIp(), ['123.123.123.123', '124.124.124.124']))
    {
        return response('Be right back!', 503);
    }

    return $next($request);
    }
}
