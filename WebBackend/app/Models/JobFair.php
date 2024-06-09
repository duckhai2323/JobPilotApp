<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JobFair extends Model
{
    use HasFactory;

     protected $table = 'jobfairs';

      protected $primaryKey = 'job_fair_id';

     /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'candidate_id',
        'job_id',
        'company_id',
        'status',
        'status_offer'
    ];
}
