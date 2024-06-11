<?php

use App\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CandidateController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\AgentController;
use App\Http\Controllers\JobDetailController;
use App\Http\Controllers\InterviewController;
use App\Http\Controllers\JobFairController;
use App\Http\Controllers\SaveJobController;


Route::post('/candidate/register',[CandidateController::class, 'registerCandidateApi']);
Route::post('/candidate/signin',[CandidateController::class,'signInCandidateApi']);

Route::post('/company',[CompanyController::class,'addNewCompanyApi']);
Route::get('/companies',[CompanyController::class,'getCompaniesApi']);
Route::get('/company/{company_id}',[CompanyController::class,'getCompanyOfId']);
Route::put('/company/{company_id}',[CompanyController::class,'updateInforCompany']);

Route::post('/agent/register',[AgentController::class,'registerAgentApi']);
Route::post('/agent/signin',[AgentController::class,'signInAgentApi']);
Route::get('/agents/{company_id}',[AgentController::class,'getListAgent']);

Route::get('/admins', [AdminController::class, 'getListAdmin']);

Route::post('/job_detail/create',[JobDetailController::class, 'addJobDetail']);
Route::get('/jobs',[JobDetailController::class,'getListJobs']);
Route::get('/jobs2',[JobDetailController::class,'getListJobs2']);
Route::get('/jobs/{company_id}',[JobDetailController::class,'getListJobsOfCompany']);
Route::delete('/job_detail/{job_id}',[JobDetailController::class,'deleteJobDetail']);
Route::get('/job_detail/{job_id}',[JobDetailController::class, 'getJobDetail']);
Route::put('/job_detail_status/{job_id}',[JobDetailController::class, 'updateStatusJob']);
Route::put('/job_detail/{job_id}',[JobDetailController::class, 'updateJobDetail']);

Route::post('/interview/create',[InterviewController::class,'addInterview']);
Route::get('/interviews/{job_id}',[InterviewController::class,'getInterviews']);
Route::put('/interviews/update/{interview_id}',[InterviewController::class,'updateInterview']);
Route::delete('/interviews/delete/{interview_id}',[InterviewController::class,'deleteInterview']);

Route::post('/jobfair/apply',[JobFairController::class,'applyJobFair']);
Route::get('/jobfair/candidates/{job_id}',[JobFairController::class,'getCandidates']);
Route::put('/jobfair/{job_fair_id}',[JobFairController::class,'updateStatusJobFair']);
Route::get('/jobfair/{candidate_id}',[JobFairController::class,'getListJobIdApply']);
Route::get('/jobfair/jobs/{candidate_id}',[JobFairController::class,'getListJobsApply']);
Route::put('/jobfair/status_offer/{job_fair_id}',[JobFairController::class,'updateOfferStatus']);




Route::post('/savejob/create',[SaveJobController::class,'saveJob']);
Route::delete('/savejob/{job_id}/{candidate_id}',[SaveJobController::class,'deleteSaveJob']);
Route::get('/savejob/{candidate_id}',[SaveJobController::class,'getListSave']);
Route::delete('/savejob/{candidate_id}',[SaveJobController::class,'deleteAllJobs']);
Route::get('/savejob_job_id/{candidate_id}',[SaveJobController::class,'getListIdJob']);


