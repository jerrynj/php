<?php

namespace App\Http\Middleware;

use Closure;

class TestMiddleware
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
        $age = $request->input('age');
        if($age < 18) {
            return redirect()->route('refuse',['age'=>'age'.$age]);
        }

        return $next($request);
    }
}
