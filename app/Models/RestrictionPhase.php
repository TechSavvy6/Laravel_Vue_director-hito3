<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RestrictionPhase extends Model
{
    use HasFactory;

    protected $fillable = [
        'codAnaResFase',
        'desAnaResFase',
        'dayFechaCreacion',
        'desUsuarioCreacion',
        'codAnaResFrente',
        'codProyecto',
        'codAnaRes',
    ];

    protected $table = 'anares_fase';
    public $timestamps = false;
}
