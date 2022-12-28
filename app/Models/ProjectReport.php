<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProjectReport extends Model
{
    use HasFactory;

    protected $fillable = [
        'codUtilReportes',
        'codProyecto',
        'flagReporteMasivo',
        'codTipoFrecuencia',
        'dayFechaCreacion',
        'desUsuarioCreacion',
        'desCorreoEnvios',
        'codfrecuenciaenvioreporte'
    ];

    protected $table = 'proy_proyectoreportes';
    public $timestamps = false;
}

