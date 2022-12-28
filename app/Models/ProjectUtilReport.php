<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProjectUtilReport extends Model
{
    use HasFactory;

    protected $fillable = [
        'codUtilReportes',
        'desUtilReportes',
        'desDirReporte',
    ];

    protected $table = 'util_reportes';
    public $timestamps = false;
}
