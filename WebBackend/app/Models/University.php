<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class University extends Model
{
    use HasFactory;
    protected $table = 'universities';

    protected $primaryKey = 'cv_id';


    protected $fillable = [
        'candidate_id',
        'univer_name',
        'specialized',
        'start_uni',
        'end_uni',
        'description',
    ];
}
