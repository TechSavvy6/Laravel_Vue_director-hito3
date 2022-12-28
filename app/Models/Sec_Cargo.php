<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Sluggable\HasSlug;

class Sec_Cargo extends Model
{
    use HasFactory;
    protected $fillable = [
        'codCargo',
        'nameCargo'
    ];
    protected $table = "Sec_Cargo";

    public $timestamps = false;

}
