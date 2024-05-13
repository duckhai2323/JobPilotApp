import 'dart:convert';

import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';
import 'package:http/http.dart' as http;
import '../../../common/api/api_backend.dart';
import '../../../common/item_object/item_job_detail.dart';
import '../../application/application_controller.dart';
import '../company_infor/company_infor_controller.dart';

class JobFairControlelr extends GetxController {
  List<ItemJobDetail> job1s = <ItemJobDetail>[].obs ;
  List<ItemJobDetail> job2s = <ItemJobDetail>[].obs ;
  List<ItemJobDetail> job3s = <ItemJobDetail>[].obs ;
  List<ItemJobDetail> job4s = <ItemJobDetail>[].obs ;
  var companyController = Get.find<CompanyInforController>();
  @override
  onInit(){
    super.onInit();
    getJobs();
  }
  Future<void> getJobs() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobApi.GET_LIST_JOBS+ApplicationController.company_id);
      final response = await http.get(url,headers: headers);
      if(response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        job1s.clear();
        job2s.clear();
        job3s.clear();
        data.forEach((e) {
          var status = e['status'].toString();
          switch (status) {
            case '1':
              job1s.add(ItemJobDetail.fromJson(e));
              break;
            case '2':
              job2s.add(ItemJobDetail.fromJson(e));
              break;
            case '3':
              job3s.add(ItemJobDetail.fromJson(e));
              break;
            default:
              break;
          }
        });
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteJobs(int job_id) async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse('${ApiEndPoints.baseUrl}${ApiEndPoints.jobApi.DELETE_JOB}${job_id}');
      final response = await http.delete(url,headers: headers);
      if(response.statusCode == 200) {
        getJobs();
        companyController.getJobs();
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }


  void HandleAddJobPage () {
    Get.toNamed(AppRoutes.ADD_JOB);
  }

  void HandleEditJobPage (int job_id) {
    Get.toNamed(AppRoutes.EDIT_JOB, parameters: {'job_id': job_id.toString()});
  }

  void HandleJobDetailPage(int job_id) {
    Get.toNamed(AppRoutes.JOB_DETAIL, parameters: {'job_id':job_id.toString()});
  }
}