import 'package:get/get.dart';
import 'package:jobpilot_app/common/candidate.dart';

class CandidateProvider extends GetConnect {
  @override
  void onInit(){
    httpClient.baseUrl = 'http://127.0.0.1:8000';
  }

  Future<Response<Candidate>> create(Candidate candidate) =>
      post('/api/register', candidate.toJson(), decoder: Candidate.fromJson);
}