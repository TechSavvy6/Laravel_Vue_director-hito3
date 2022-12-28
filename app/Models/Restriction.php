<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Restriction extends Model
{
    use HasFactory;

    protected $fillable = [
        'codProyecto',
        'codEstado',
        'dayFechaCreacion',
        'desUsuarioCreacion',
        'indNoRetrasados',
        'indRetrasados',
        'codAnaRes'
    ];

    protected $table = 'anares_analisisrestricciones';
    public $timestamps = false;
}

