<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RestrictionMember extends Model
{
    use HasFactory;

    protected $fillable = [
        'codProyecto',
        'codAnaRes',
        'codEstado',
        'dayFechaCreacion',
        'desUsuarioCreacion',
        'codProyIntegrante',
    ];

    protected $table = 'ana_integrantes';
    public $timestamps = false;
}

