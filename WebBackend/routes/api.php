<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Faker\Factory;
Route::post('/candidate/register',[UserController::class, 'registerUser']);
Route::post('/candidate/signin',[UserController::class,'signInUser']);