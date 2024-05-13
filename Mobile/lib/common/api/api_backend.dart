import 'package:jobpilot_app/common/api/auth_account.dart';
import 'package:jobpilot_app/common/api/company_api.dart';
import 'package:jobpilot_app/common/api/interview.dart';
import 'package:jobpilot_app/common/api/job_api.dart';
import 'package:jobpilot_app/common/api/jobfair_api.dart';

class ApiEndPoints {
  static final String baseUrl = 'http://10.0.2.2:8000/api/';
  static AuthAccount authAccount = AuthAccount();
  static CompanyApi companyApi = CompanyApi();
  static JobApi jobApi = JobApi();
  static InterviewApi interviewApi  = InterviewApi();
  static JobFairApi jobFairApi = JobFairApi();
}
