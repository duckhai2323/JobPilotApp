<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::get('/companies/display', function() {
    return Inertia::render('companies/display');
})->middleware(['auth', 'verified'])->name('companies.display');

Route::get('/jobfairs/display', function() {
    return Inertia::render('jobfairs/display');
})->middleware(['auth', 'verified'])->name('jobfairs.display');

Route::get('/admins/display', function() {
    return Inertia::render('admins/display');
})->middleware(['auth', 'verified'])->name('admins.display');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
