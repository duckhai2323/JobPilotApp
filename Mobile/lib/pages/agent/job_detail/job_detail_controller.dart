import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/common/interview.dart';
import '../../../common/api/api_backend.dart';
import '../../../common/item_add_edit/item_add_interview.dart';
import '../../../common/item_object/item_job_detail.dart';
import '../../../common/job_detail.dart';

class JobDetailAgentController extends GetxController with GetSingleTickerProviderStateMixin {
  List<JobDetail> jobDetails = <JobDetail>[].obs;
  List<Interview> interviews = <Interview>[].obs;
  late TabController tabController;
  final stateTab = 0.obs;
  final job_id = ''.obs;

  @override
  onInit(){
    super.onInit();
    job_id.value = Get.parameters['job_id']??"";
    tabController = TabController(length: 3, vsync: this);
    getJobDetail();
    getInterviews();
  }

  Future<void> getJobDetail() async {
    jobDetails.clear();
    try{
      var headers = {'Content-TYpe':'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobApi.JOB_DETAIL+job_id.value);
      final response = await http.get(url,headers: headers);
      if(response.statusCode ==  200) {
        jobDetails.add(JobDetail.fromJson(jsonDecode(response.body)));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getInterviews() async {
    interviews.clear();
    try{
      var headers = {'Content-TYpe':'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.interviewApi.INTERVIEW_GET+job_id.value);
      final response = await http.get(url,headers: headers);
      if(response.statusCode ==  200) {
        interviews.add(Interview(int.parse(job_id.value), 'Hạn nộp hồ sơ', 2, jobDetails[0].deadline_job, jobDetails[0].status >= 2?1:0));
        interviews.addAll((jsonDecode(response.body) as List).map((e) => Interview.fromJson(e)).toList());
      }
    } catch (e) {
      print(e);
    }
  }

  void onPageChange(int index) {
    tabController.animateTo(index);
    stateTab.value = index;
  }

}