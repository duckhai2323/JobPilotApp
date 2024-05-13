<?php

namespace App\Http\Controllers;
use App\Models\JobDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JobDetailController extends Controller
{
    public function addJobDetail (Request $request) {
        $request->validate([
            'job_title' => 'required|string|max:255',
            'job_details' => 'required|string|max:500',
            'job_require' => 'required|string|max:500',
            'job_benefit' => 'required|string|max:500',
            'salary' => 'required|string|max:255',
            'job_location' => 'required|string|max:255',
            'candidate_number' => 'required|numeric',
            'experience_require' => 'required|string|max:255',
            'work_form' => 'required|string|max:255',
            'deadline_job' => 'required|string|max:255',
        ]);

        $data = $request->all();
        $jobdetail = JobDetail::create([
            'company_id' => $data['company_id'],
            'job_title' => $data['job_title'],
            'job_details' => $data['job_details'],
            'job_require' => $data['job_require'],
            'job_benefit' => $data['job_benefit'],
            'salary' => $data['salary'],
            'job_location' => $data['job_location'],
            'candidate_number' => $data['candidate_number'],
            'experience_require' => $data['experience_require'],
            'work_form' => $data['work_form'],
            'status' => $data['status'],
            'deadline_job' => $data['deadline_job'],
        ]);

        return response()->json(['job_id' => $jobdetail->id], 200);
    }

    public function getListJobs () {
        $jobs = DB::table('job_details')
                    ->where('job_details.status',1)
                    ->orderBy('job_details.updated_at', 'desc')
                    ->join('companies', 'job_details.company_id','=', 'companies.company_id')
                    ->select('companies.company_image','companies.company_name','companies.company_id','job_details.job_id','job_details.job_title','job_details.job_location','job_details.experience_require','job_details.salary','job_details.deadline_job','job_details.status','job_details.candidate_number')
                    ->get();

        return response() -> json($jobs,200);
    }

    public function getListJobsOfCompany (string $company_id) {
        $jobs = DB::table('job_details')
                    ->join('companies', 'job_details.company_id','=', 'companies.company_id')
                    ->where('job_details.company_id',$company_id)
                    ->orderBy('job_details.updated_at', 'desc')
                    ->select('companies.company_image','companies.company_name','companies.company_id','job_details.job_id','job_details.job_title','job_details.job_location','job_details.experience_require','job_details.salary','job_details.deadline_job','job_details.status','job_details.candidate_number')
                    ->get();

        return response() -> json($jobs,200);
    }

    public function deleteJobDetail(string $job_id) {

        $delete_interview = DB::table('interviews')
                           ->where('interviews.job_id',$job_id)
                           ->delete();

        $delete_job = DB::table('job_details')
                      ->where('job_details.job_id','=',$job_id)
                      ->delete();
        return response()->json(['message'=>'delete succsess'],200);
    }

    public function getJobDetail(string $job_id) {
        $job_detail = DB::table('job_details')
                    ->where('job_details.job_id',$job_id)
                    ->first();
        if($job_detail) {
            return response()->json($job_detail,200);
        } else {
            return response()->json(['message' =>'job_detail not found'],404);
        }
    }

    public function updateJobDetail(Request $request, $job_id) {
        $request->validate([
            'job_title' => 'required|string|max:255',
            'job_details' => 'required|string|max:500',
            'job_require' => 'required|string|max:500',
            'job_benefit' => 'required|string|max:500',
            'salary' => 'required|string|max:255',
            'job_location' => 'required|string|max:255',
            'candidate_number' => 'required|numeric',
            'experience_require' => 'required|string|max:255',
            'work_form' => 'required|string|max:255',
            'deadline_job' => 'required|string|max:255',
        ]);
        
        $data = $request->all();
        $job = DB::table('job_details')->where('job_details.job_id', $job_id)
                        ->update($data);
        return response()->json(['message' => 'job_detail update successfully'], 200);
    }
}
