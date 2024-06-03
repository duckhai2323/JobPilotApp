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

    public function getListJobsApply($candidate_id) {
        $listJobs = DB::table('jobfairs')
                      ->where('jobfairs.candidate_id','=',$candidate_id)
                      ->join('job_details','jobfairs.job_id','=','job_details.job_id')
                      ->join('companies','jobfairs.company_id','=','companies.company_id')
                      ->orderBy('job_details.updated_at', 'desc')
                      ->select('companies.company_image','companies.company_name','companies.company_id','job_details.job_id','job_details.job_title','job_details.job_location','job_details.experience_require','job_details.salary','job_details.deadline_job','job_details.status','job_details.candidate_number','jobfairs.status_offer','jobfairs.status AS jobfair_status','jobfairs.job_fair_id')
                      ->get();

        return response() -> json($listJobs,200);         
    }

    public function updateOfferStatus(Request $request,string $job_fair_id){
        $data = $request->all();
        $jobfair = JobFair::where('job_fair_id',$job_fair_id)
                          ->first();
        if($jobfair) {
            $jobfair->update(['status_offer' => $data['status_offer']]);
            return response()->json(['message' => 'Status updated successfully'], 200);
        }else {
              return response()->json(['message' => 'Jobfair not found'], 404);
        }
    }
}
