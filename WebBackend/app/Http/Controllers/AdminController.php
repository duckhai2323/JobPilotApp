<?php

namespace App\Http\Controllers;
use App\Models\User;

class AdminController extends Controller {
    public function getListAdmin() {
        $listAdmins = User::all();
        return response()->json($listAdmins,200); 
    }
}