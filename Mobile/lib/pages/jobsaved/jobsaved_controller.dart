import 'dart:convert';

import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/pages/application/application_controller.dart';

import '../../common/api/api_backend.dart';
import '../../common/item_object/item_job_detail.dart';
import '../application/home/home_controller.dart';

class JobSavedController extends GetxController{
  List<ItemJobDetail> listJobs = <ItemJobDetail>[].obs;
  var homController = Get.find<HomeController>();

  @override
  onInit(){
    super.onInit();
    getListJobs();
  }

  Future<void> getListJobs() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.saveJobApi.GET_LIST_SAVE+ApplicationController.user_id);
      final response = await http.get(url,headers: headers);
      if(response.statusCode == 200) {
        listJobs.clear();
        listJobs.addAll((jsonDecode(response.body) as List).map((e) => ItemJobDetail.fromJson(e)).toList());
        print(response.statusCode);
        return;
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }


  Future<void> deleteSaveJob(int index) async{
    var tempp = listJobs[index];
    var headers = {'Content-Type' : 'application/json'};
    var url = Uri.parse('${ApiEndPoints.baseUrl}${ApiEndPoints.saveJobApi.DELETE_SAVE_JOB}${tempp.job_id}/${ApplicationController.user_id}');
    final response = await http.delete(url,headers: headers);
    listJobs.removeAt(index);
    homController.getListSaveJobId();
    print(response.body);
  }

  Future<void> deleteAllJob() async{
    var headers = {'Content-Type' : 'application/json'};
    var url = Uri.parse('${ApiEndPoints.baseUrl}${ApiEndPoints.saveJobApi.DELETE_SAVE_JOB}${ApplicationController.user_id}');
    final response = await http.delete(url,headers: headers);
    listJobs.clear();
    homController.listJobIdSave.clear();
    print(response.body);
  }


  void HandleJobDetails () {
    Get.toNamed(AppRoutes.JOBDETAILS);
  }
}