<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProjectUser extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'codProyecto',
        'id',
        'codEstadoInvitacion',
        'desArea',
        'dayFechaInvitacion',
        'dayFechaInvitationConfirm',
        'codRolIntegrante',
        'codProyIntegrante',
        'desCorreo'
    ];

    protected $table = 'proy_integrantes';
    public $timestamps = false;
}
