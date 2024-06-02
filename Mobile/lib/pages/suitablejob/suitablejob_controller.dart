import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/pages/application/home/home_controller.dart';
import '../../common/api/api_backend.dart';
import '../../common/item_object/item_job_detail.dart';
import '../../common/routes/names.dart';
import '../application/application_controller.dart';

class SuitableController extends GetxController{

  List<ItemJobDetail> listJobs = <ItemJobDetail>[].obs;
  List<String> listJobIdSave = <String>[].obs;
  var homController = Get.find<HomeController>();

  @override
  onInit(){
    super.onInit();
    getListSaveJobId();
    getListJobs();
  }

  void HandleJobdetails (int job_id,int company_id) {
    Get.toNamed(AppRoutes.JOBDETAILS,parameters: {'job_id':job_id.toString(),'company_id':company_id.toString()});
  }

  Future<void> getListSaveJobId() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.saveJobApi.GET_LIST_SAVE_JOB_ID+ApplicationController.user_id);
      final response = await http.get(url,headers: headers);
      if(response.statusCode == 200) {
        listJobIdSave.clear();
        listJobIdSave.addAll((jsonDecode(response.body) as List).map((e) => e['job_id'].toString()).toList());
        print(listJobIdSave);
        return;
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }


  Future<void> getListJobs() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobApi.GET_LIST_JOBS);
      final response = await http.get(url,headers: headers);
      if(response.statusCode == 200) {
        listJobs.clear();
        listJobs.addAll((jsonDecode(response.body) as List).map((e) => ItemJobDetail.fromJson(e)).toList());
        //print(response.body);
        return;
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateSaveJob(int index) async{
    ItemJobDetail tempp = listJobs[index];
    bool saveJob = listJobIdSave.contains(tempp.job_id.toString());
    var headers = {'Content-Type' : 'application/json'};
    if(saveJob) {
      listJobIdSave.remove(tempp.job_id.toString());
      var url = Uri.parse('${ApiEndPoints.baseUrl}${ApiEndPoints.saveJobApi.DELETE_SAVE_JOB}${tempp.job_id}/${ApplicationController.user_id}');
      final response = await http.delete(url,headers: headers);
      print(response.body);
    } else {
      listJobIdSave.add(tempp.job_id.toString());
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.saveJobApi.SAVE_JOB);
      Map body = {
        'candidate_id':ApplicationController.user_id,
        'job_id':tempp.job_id
      };
      final response = await http.post(url,body: jsonEncode(body),headers: headers);
      print(response.statusCode);
    }
    homController.getListSaveJobId();
  }

}