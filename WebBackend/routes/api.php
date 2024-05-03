<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CandidateController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\AgentController;
use App\Http\Controllers\JobDetailController;
Route::post('/candidate/register',[CandidateController::class, 'registerCandidateApi']);
Route::post('/candidate/signin',[CandidateController::class,'signInCandidateApi']);

Route::post('/company',[CompanyController::class,'addNewCompanyApi']);
Route::get('/companies',[CompanyController::class,'getCompaniesApi']);

Route::post('/agent/register',[AgentController::class,'registerAgentApi']);
Route::post('/agent/signin',[AgentController::class,'signInAgentApi']);

Route::post('/job_detail/create',[JobDetailController::class, 'addJobDetail']);
Route::get('/jobs',[JobDetailController::class,'getListJobs']);