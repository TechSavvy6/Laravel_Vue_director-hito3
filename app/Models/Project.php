<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Sluggable\HasSlug;

class Project extends Model
{
    use HasFactory;
    protected $fillable = [
        'codProyecto',
        'desNombreProyecto',
        'codEstado',
        'id',
        'desEmpresa',
        'numPlazo',
        'numAreaTechado',
        'desTipoProyecto',
        'codUbigeo',
        'dayFechaInicio',
        'numMontoReferencial',
        'numAreaTechada',
        'numAreaConstruida',
        'desPais',
        'desDireccion',
        'dayFechaCreacion',
        'desUsuarioCreacion'
    ];
    protected $table = "proy_proyecto";

    public $timestamps = false;

}
