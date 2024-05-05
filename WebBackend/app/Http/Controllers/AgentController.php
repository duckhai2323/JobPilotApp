<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\Agent;

class AgentController extends Controller
{
    public function registerAgentApi (Request $request) {
        $request -> validate ([
            'agent_name' => 'required|string|max:255',
            'agent_email' => 'required|string|lowercase|email|max:255|unique:'.Agent::class,
            'agent_password' => 'required|min:8',
            'password_confirmation' => 'required|same:agent_password'
        ]);

        $data = $request->all();
        $agent = Agent::create([
        'agent_name' => $data['agent_name'],
        'agent_email' => $data['agent_email'],
        'agent_password' => Hash::make($data['agent_password']),
        'agent_image' => 'https://t4.ftcdn.net/jpg/05/49/98/39/360_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg',
        'company_id' => $data['company_id'],
        'status' => $data['status'],
        ]);

        return response()->json(['message' => 'Agent registered successfully'], 200);
    }

    public function signInAgentApi (Request $request) {
        $data = $request->all();
        $email = $data['email'];
        $password = $data['password'];
        $user = Agent::where('agent_email', $email)
                      -> first();              
        if(Hash::check($password, $user->agent_password)) {
            return response()->json($user,200);
        } else {
            return response()->json(['message'=>'user not found'],404);
        }
    } 
}
