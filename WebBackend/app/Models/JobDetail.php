<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JobDetail extends Model
{
    use HasFactory;

    protected $table = 'job_details';

    protected $fillable = [
        'company_id',
        'job_title',
        'job_details',
        'job_require',
        'job_benefit',
        'salary',
        'job_location',
        'candidate_number',
        'experience_require',
        'work_form',
        'deadline_job',
        'status',
    ];
}

