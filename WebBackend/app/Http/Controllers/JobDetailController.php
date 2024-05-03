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
        ]);

        return response()->json(['message' => 'JobDetail registered successfully'], 200);
    }

    public function getListJobs () {
        $jobs = DB::table('job_details')
                    ->join('companies', 'job_details.company_id','=', 'companies.company_id')
                    ->select('companies.company_image','companies.company_name','job_details.job_title','job_details.job_location','job_details.experience_require','job_details.salary')
                    ->get();

        return response() -> json($jobs,200);
    }
}
