import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/common/item_object/item_job_detail.dart';
import 'package:jobpilot_app/common/routes/names.dart';
import 'package:jobpilot_app/pages/application/application_controller.dart';

import '../../../common/api/api_backend.dart';
import '../../../common/company.dart';

class HomeController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  List<Company> listCompanies = <Company>[].obs;
  List<ItemJobDetail> listJobs = <ItemJobDetail>[].obs;
  List<String> listJobIdSave = <String>[].obs;
  List<String> listJobIdApply = <String>[].obs;

  @override
  onInit(){
    super.onInit();
    getListSaveJobId();
    getListJobs();
    getListCompanies();
    getListApplyJobId();
  }
  Future<void> getListCompanies() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.companyApi.GET_LIST_COMPANIES);
      final response = await http.get(url,headers: headers);
      if(response.statusCode == 200) {
        listCompanies.addAll((jsonDecode(response.body) as List).map((e) => Company.fromJson(e)).toList());
        // print(response.body);
        return;
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getListSaveJobId() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.saveJobApi.GET_LIST_SAVE_JOB_ID+ApplicationController.user_id);
      final response = await http.get(url,headers: headers);
      if(response.statusCode == 200) {
        listJobIdSave.clear();
        listJobIdSave.addAll((jsonDecode(response.body) as List).map((e) => e['job_id'].toString()).toList());
        print(response.statusCode);
        return;
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getListApplyJobId() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobFairApi.GET_LIST_JOB_ID+ApplicationController.user_id);
      final response = await http.get(url,headers: headers);
      if(response.statusCode == 200) {
        listJobIdApply.clear();
        listJobIdApply.addAll((jsonDecode(response.body) as List).map((e) => e['job_id'].toString()).toList());
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

  final statePageView = 0.obs;
  void ChangePageView (int page) {
    statePageView.value = page;
  }
  void HandleNotifiPage () {
    Get.toNamed(AppRoutes.NOTIFICATION);
  }

  void HandleJobdetails (int job_id,int company_id) {
    bool apply = listJobIdApply.contains(job_id.toString());
    bool save = listJobIdSave.contains(job_id.toString());
    Get.toNamed(AppRoutes.JOBDETAILS,parameters: {'job_id':job_id.toString(),'company_id':company_id.toString(),'apply':apply.toString(),'save':save.toString()});
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

  }

  void HandleCompaniesPage () {
    Get.toNamed(AppRoutes.COMPANIES);
  }

  void HandleSuitableJobPage () {
    Get.toNamed(AppRoutes.SUITABLE_JOB);
  }
  void HandleAttractiveJobPage () {
    Get.toNamed(AppRoutes.ATTRACTIVE_JOB);
  }
}