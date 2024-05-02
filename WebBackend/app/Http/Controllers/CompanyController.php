<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Company;

class CompanyController extends Controller
{

    public function getCompaniesApi () {
        $companies = Company::all();
        return response()->json($companies,200); 
    }

    public function addNewCompanyApi (Request $request) 
    {

        $request->validate([
            'company_name' => 'required|string|max:255',
            'email' => 'required|string|lowercase|email|max:255|unique:'.Company::class,
            'employee_scale' => 'required',
            'company_intro' => 'required|string|max:500',
            'company_link' => 'required|url',
            'company_image' => 'required|url',
            'company_location' => 'required|string|max:255',
            'company_filed' => 'required|string|max:255',
            'status' => 'required|numeric|min:0|max:10',
        ]);

        $data = $request->all();
        $user = Company::create ([
            'company_name' => $data['company_name'],
            'email' => $data['email'],
            'employee_scale' => $data['employee_scale'],
            'company_intro' => $data['company_intro'],
            'company_link' => $data['company_link'],
            'company_image' => $data['company_image'],
            'company_location' => $data['company_location'],
            'company_filed' => $data['company_filed'],
            'status' => $data['status'],
        ]);

        return response()->json(['message' => 'User registered successfully'], 200);
    }

}
