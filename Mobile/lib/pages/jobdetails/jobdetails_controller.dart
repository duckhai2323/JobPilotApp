import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/job_detail.dart';
import 'package:jobpilot_app/common/routes/names.dart';
import 'package:http/http.dart' as http;
import '../../common/api/api_backend.dart';
import '../../common/company.dart';
import '../../common/item_object/item_job_detail.dart';
import '../application/application_controller.dart';

class JobDetailsController extends GetxController with GetSingleTickerProviderStateMixin{
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  PageController pageController = PageController(initialPage: 0);
  final statePageView = 0.obs;
  List<Company> companies = <Company>[].obs ;
  List<ItemJobDetail> jobs = <ItemJobDetail>[].obs ;
  List<JobDetail> jobDetails = <JobDetail>[].obs;
  final job_id = ''.obs;
  final company_id = ''.obs;
  late TabController tabController;

  @override
  onInit(){
    super.onInit();
    job_id.value = Get.parameters['job_id']??"";
    company_id.value = Get.parameters['company_id']??"";
    getJobDetail();
    getCompany();
    getJobs();
    tabController = TabController(length: 4, vsync: this);
    scrollController = ScrollController()
      ..addListener(() {
        isSliverAppBarExpanded.value = isSliverAppBarExpandedCheck();
      });
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



  Future<void> getCompany() async {
    companies.clear();
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.companyApi.GET_COMPANY_INFOR+company_id.value);
      final response = await http.get(url,headers: headers);
      if(response.statusCode == 200) {
        Company company = Company.fromJson(jsonDecode(response.body));
        companies.add(company);
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getJobs() async {
    jobs.clear();
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobApi.GET_LIST_JOBS+company_id.value);
      final response = await http.get(url,headers: headers);
      await Future.delayed(const Duration(seconds: 1));
      if(response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        data.forEach((e) {
          var status = e['status'].toString();
          if(status == '1' && e['job_id'].toString() != job_id.value) {
            jobs.add(ItemJobDetail.fromJson(e));
          }
        });
        print(jobs.length);
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }


  void ChangePageView (int page) {
    statePageView.value = page;
  }
  void RevertPageView (){
    if(statePageView.value != 0) {
      pageController.animateToPage(statePageView.value-1, duration: const Duration(microseconds: 300), curve: Curves.decelerate);
    }
  }
  void NextPageView (){
    if(statePageView.value < 6) {
      pageController.animateToPage(statePageView.value+1, duration: const Duration(microseconds: 300), curve: Curves.decelerate);
    }
  }
  bool isSliverAppBarExpandedCheck () {
    return scrollController.hasClients &&
        scrollController.offset > 350;
  }

  void HandleJobdetails (int jobId, int companyId) {
   job_id.value = jobId.toString();
   company_id.value = companyId.toString();
   tabController.animateTo(0);
   scrollController.animateTo(0,curve: Curves.easeOut, duration: Duration(milliseconds: 100),);
   getJobDetail();
   getCompany();
   getJobs();
  }

  void HandleApplyJobPage () {
    Get.toNamed(AppRoutes.APPLYJOB);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}