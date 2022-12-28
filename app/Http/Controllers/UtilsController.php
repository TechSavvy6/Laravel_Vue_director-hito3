<?php

namespace App\Http\Controllers;
use App\Models\Sec_Cargo;
use Illuminate\Testing\Fluent\Concerns\Has;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class UtilsController extends Controller
{

    public function get_cargos () {
        $secCargo = Sec_Cargo::all();
        return $secCargo;
    }

}
