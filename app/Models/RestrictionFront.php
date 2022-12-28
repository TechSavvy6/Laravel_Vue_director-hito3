<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RestrictionFront extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'codAnaResFrente',
        'desAnaResFrente',
        'dayFechaCreacion',
        'desUsuarioCreacion',
        'codProyecto',
        'codAnaRes',
    ];

    protected $table = 'anares_frente';
    public $timestamps = false;
}
