<?php
namespace App\Http\Controllers;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Faker\Factory;
class UserController extends Controller
{
    public function registerUser (Request $request ) {
        $data = $request->all();
        $user = User::create([
            'candidate_id' => fake()->unique()->randomNumber(),
            'candidate_name' => $data['candidate_name'],
            'candidate_email' => $data['candidate_email'],
            'candidate_password' => $data['candidate_password'],
            'remember_token' => Str::random(10),
            'status' => $data['status'],
        ]);
        return response()->json(['message' => 'User registered successfully'], 200);
    }

    public function signInUser (Request $request) {
        $data = $request->all();
        $email = $data['candidate_email'];
        $password = $data['candidate_password'];
        $user = User::where('candidate_email', $email)
                      -> where('candidate_password',$password)
                      -> first();
        if($user) {
            return response()->json(['message'=>'user found'],200);
        } else {
            return response()->json(['message'=>'user not found'],404);
        }
    }              
}
