<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CandidateController;
use App\Http\Controllers\CompanyController;
use App\Models\User;
Route::post('/candidate/register',[CandidateController::class, 'registerCandidateApi']);
Route::post('/candidate/signin',[CandidateController::class,'signInCandidateApi']);

Route::post('/company',[CompanyController::class,'addNewCompanyApi']);
Route::get('/companies',[CompanyController::class,'getCompaniesApi']);