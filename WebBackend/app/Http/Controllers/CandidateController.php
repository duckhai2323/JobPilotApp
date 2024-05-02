<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\Candidate;
use Faker\Factory;
class CandidateController extends Controller
{
    public function registerCandidateApi (Request $request) {
        $request -> validate ([
            'candidate_name' => 'required|string|max:255',
            'candidate_email' => 'required|string|lowercase|email|max:255|unique:'.Candidate::class,
            'candidate_password' => 'required|min:8',
            'password_confirmation' => 'required|same:candidate_password'
        ]);

        $data = $request->all();
        $candidate = Candidate::create([
        'candidate_name' => $data['candidate_name'],
        'candidate_email' => $data['candidate_email'],
        'candidate_password' => Hash::make($data['candidate_password']),
        'candidate_image' => 'https://t4.ftcdn.net/jpg/05/49/98/39/360_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg',
        'status' => $data['status'],
        ]);

        return response()->json(['message' => 'Candidate registered successfully'], 200);
    }

    public function signInCandidateApi (Request $request) {
        $data = $request->all();
        $email = $data['candidate_email'];
        $password = $data['candidate_password'];
        $user = Candidate::where('candidate_email', $email)
                      -> first();              
        if(Hash::check($password, $user->candidate_password)) {
            return response()->json(['message'=>'user found'],200);
        } else {
            return response()->json(['message'=>'user not found'],404);
        }
    }              
}
