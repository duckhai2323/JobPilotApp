<?php

namespace App\Http\Controllers;
use App\Models\Interview;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InterviewController extends Controller
{
    public function addInterview (Request $request) {
        $request->validate([
            'job_id' => 'required|integer',
            'interview_type' => 'required|string|max:255',
            'index' => 'required|numeric|min:0|max:10',
            'interview_date' => 'required|string|max:255',
            'status' => 'required|numeric|min:0|max:10',
        ]);

        $data = $request->all();
        $interview = Interview::create ([
            'job_id' => $data['job_id'],
            'interview_type' => $data['interview_type'],
            'index' => $data['index'],
            'interview_date' => $data['interview_date'],
            'status' => $data['status'],
        ]);

        return response()->json(['message' => 'Interview created successfully'], 200);
    }

    public function getInterviews (string $job_id) {
        $interviews = DB::table('interviews')
                     ->where('interviews.job_id',$job_id)
                     ->orderBy('interviews.index', 'asc')
                     ->get();
        
        return response()->json($interviews,200);
    }

    public function updateInterview(Request $request, $interview_id ) {
        $request->validate([
            'job_id' => 'required|integer',
            'interview_type' => 'required|string|max:255',
            'index' => 'required|numeric|min:0|max:10',
            'interview_date' => 'required|string|max:255',
            'status' => 'required|numeric|min:0|max:10',
        ]);

        $data = $request->all();
        $interview = DB::table('interviews')->where('interviews.interview_id', $interview_id)
                                ->update($data);
        return response()->json(['message' => 'interview update successfully'], 200);
    }

    public function deleteInterview(Request $request, $interview_id) {
        $delete = DB::table('interviews')->where('interview_id', $interview_id)
                            ->delete();
        return response()->json(['message' => 'delete successfully'], 200);
    }
}
