<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Fileinput;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Session;

class FileinputController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return void
     */
    public function index()
    {
        $fileinput = Fileinput::paginate(15);

        return view('fileinput.index', compact('fileinput'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return void
     */
    public function create()
    {
        return view('fileinput.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return void
     */
    public function store(Request $request)
    {
        
        Fileinput::create($request->all());

        Session::flash('flash_message', 'Fileinput added!');

        return redirect('fileinput');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     *
     * @return void
     */
    public function show($id)
    {
        $fileinput = Fileinput::findOrFail($id);

        return view('fileinput.show', compact('fileinput'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     *
     * @return void
     */
    public function edit($id)
    {
        $fileinput = Fileinput::findOrFail($id);

        return view('fileinput.edit', compact('fileinput'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     *
     * @return void
     */
    public function update($id, Request $request)
    {
        
        $fileinput = Fileinput::findOrFail($id);
        $fileinput->update($request->all());

        Session::flash('flash_message', 'Fileinput updated!');

        return redirect('fileinput');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     *
     * @return void
     */
    public function destroy($id)
    {
        Fileinput::destroy($id);

        Session::flash('flash_message', 'Fileinput deleted!');

        return redirect('fileinput');
    }
}
