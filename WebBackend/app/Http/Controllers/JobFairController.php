<?php

namespace App\Http\Controllers;

use App\Models\JobFair;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JobFairController extends Controller
{
    public function applyJobFair (Request $request) {
        $request->validate([
            'job_id' => 'required|integer',
            'candidate_id' => 'required|integer',
            'status' => 'required|numeric|min:0|max:10',
            'company_id' =>  'required|integer',
        ]);

        $data = $request->all();
        $jobfair = JobFair::create([
            'job_id'=>$data['job_id'],
            'candidate_id'=>$data['candidate_id'],
            'status'=>$data['status'],
            'company_id'=>$data['company_id'],
            'status_offer'=>$data['status_offer'],
        ]);

        return response()->json(['message' => 'JobFair create successfully'], 200);
    }

    public function getCandidates (string $job_id) {
        $candidates = DB::table('jobfairs')
                    ->where('jobfairs.status','>',0)
                    ->where('jobfairs.job_id','=',$job_id)
                    ->join('candidates','jobfairs.candidate_id','=','candidates.candidate_id')
                    ->where('candidates.status','=',1)
                    ->select('candidates.candidate_name','candidates.candidate_email','candidates.candidate_image','jobfairs.status_offer','jobfairs.job_fair_id')
                    ->get();

        return response() -> json($candidates,200);
    }

    public function updateStatusJobFair(Request $request,string $job_fair_id){
        $data = $request->all();
        $jobfair = JobFair::where('job_fair_id',$job_fair_id)
                          ->first();
        if($jobfair) {
            $jobfair->update(['status' => $data['status']]);
            return response()->json(['message' => 'Status updated successfully'], 200);
        }else {
              return response()->json(['message' => 'Jobfair not found'], 404);
        }
    }

    public function getListJobIdApply($candidate_id) {
        $listJobId = DB::table('jobfairs')
                       ->where('jobfairs.candidate_id','=',$candidate_id)
                       ->select('jobfairs.job_id')
                       ->get();
        return  response() -> json($listJobId,200);
    }
}
