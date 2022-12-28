<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RestrictionPerson extends Model
{
    use HasFactory;

    protected $fillable = [
        'codTipoRestricciones',
        'desTipoRestricciones',
    ];

    protected $table = 'anares_tiporestricciones';
    public $timestamps = false;
}
