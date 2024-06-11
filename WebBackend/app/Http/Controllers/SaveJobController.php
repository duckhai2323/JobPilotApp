<?php

namespace App\Http\Controllers;
use App\Models\SaveJob;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SaveJobController extends Controller
{
    public function saveJob(Request $request) {
        $request->validate([
            'candidate_id' => 'required|integer',
            'job_id' => 'required|integer'
        ]);

        $data = $request->all();
        $saveJob = SaveJob::create([
            'candidate_id' => $data['candidate_id'],
            'job_id' => $data['job_id'],
        ]);

        return response()->json(['message'=>'save job succsess'], 200);
    }

    public function deleteSaveJob($job_id, $candidate_id) {
         $deleted = DB::table('savejobs')
            ->where('job_id', $job_id)
            ->where('candidate_id', $candidate_id)
            ->delete();

        if ($deleted) {
            return response()->json(['message' => 'Record deleted successfully']);
        } else {
            return response()->json(['message' => 'Record not found'], 404);
        }
    }

    public function getListSave($candidate_id) {
        $listSaveJobs = DB::table('savejobs')
                           ->where('savejobs.candidate_id',$candidate_id)
                           ->join('job_details','savejobs.job_id','=','job_details.job_id')
                           ->join('companies', 'job_details.company_id','=', 'companies.company_id')
                           ->orderBy('job_details.updated_at', 'desc')
                           ->select('companies.company_image','companies.company_name','companies.company_id','job_details.job_id','job_details.job_title','job_details.job_location','job_details.experience_require','job_details.salary','job_details.deadline_job','job_details.status','job_details.candidate_number')
                           ->get();

        return response() -> json($listSaveJobs,200);
    }

    public function getListIdJob($candidate_id) {
        $listIdJobs = DB::table('savejobs')
                      ->where('savejobs.candidate_id',$candidate_id)
                      ->select('savejobs.job_id')
                      ->get();
        return response() -> json($listIdJobs,200);
    }

    public function deleteAllJobs($candidate_id) {
        $deleted = DB::table('savejobs')
            ->where('candidate_id', $candidate_id)
            ->delete();

        if ($deleted) {
            return response()->json(['message' => 'Record deleted successfully']);
        } else {
            return response()->json(['message' => 'Record not found'], 404);
        }
    }
}
