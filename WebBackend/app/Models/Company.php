<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    use HasFactory;


    protected $table = 'companies';

     /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'company_name',
        'email',
        'employee_scale',
        'company_intro',
        'company_link',
        'company_image',
        'company_location',
        'company_organize',
        'company_filed',
        'status',
    ];
}
