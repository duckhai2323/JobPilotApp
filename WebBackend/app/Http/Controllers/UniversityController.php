<?php

namespace App\Http\Controllers;
use App\Models\University;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UniversityController extends Controller
{
    public function addUniversity (Request $request) {
        $request->validate([
            'candidate_id' => 'required',
            'univer_name' => 'required|string|max:250',
            'specialized' => 'required|string|max:250',
            'start_uni' => 'required|string|max:250',
            'end_uni' => 'required|string|max:255',
        ]);

        $data = $request->all();
        $univer = University::create([
            'candidate_id' => $data['candidate_id'],
            'univer_name' => $data['univer_name'],
            'specialized' => $data['specialized'],
            'start_uni' => $data['start_uni'],
            'end_uni' => $data['end_uni'],
            'description' => $data['description'],
        ]);

        return response()->json(['message'=>'Add Univer succsess'],200);
    }

    public function getListUniver($candidate_id) {
        $univers = DB::table('universities')
                    ->where('universities.candidate_id',$candidate_id)
                    ->get();
        if($univers) {
            return response()->json($univers,200);
        } else {
            return response()->json(['message' =>'job_detail not found'],404);
        }
    }
}
