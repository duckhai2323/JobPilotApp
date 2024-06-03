import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/job_detail.dart';
import 'package:jobpilot_app/common/routes/names.dart';
import 'package:http/http.dart' as http;
import '../../common/api/api_backend.dart';
import '../../common/company.dart';
import '../../common/interview.dart';
import '../../common/item_object/item_job_detail.dart';
import '../application/application_controller.dart';
import '../application/home/home_controller.dart';

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
  final apply = ''.obs;
  final save = ''.obs;
  late TabController tabController;
  var homController = Get.find<HomeController>();
  List<Interview> interviews = <Interview>[].obs;

  @override
  onInit(){
    super.onInit();
    job_id.value = Get.parameters['job_id']??"";
    company_id.value = Get.parameters['company_id']??"";
    apply.value = Get.parameters['apply']??"";
    save.value = Get.parameters['save']??"";
    getJobDetail();
    getInterviews();
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


  Future<void> getInterviews() async {
    interviews.clear();
    try{
      var headers = {'Content-TYpe':'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.interviewApi.INTERVIEW_GET+job_id.value);
      final response = await http.get(url,headers: headers);
      if(response.statusCode ==  200) {
        interviews.add(Interview(int.parse(job_id.value), 'Đóng hồ sơ', 1, jobDetails[0].deadline_job, jobDetails[0].status >= 2 || jobDetails[0].status == 0?1:0));
        interviews.add(Interview(int.parse(job_id.value), 'Vòng loại hồ sơ', 2, jobDetails[0].deadline_job, jobDetails[0].status >= 3 || jobDetails[0].status == 0?1:0));
        interviews.addAll((jsonDecode(response.body) as List).map((e) => Interview.fromJson(e)).toList());
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

  Future<void> updateSaveJob() async{
    var headers = {'Content-Type' : 'application/json'};

    if(bool.parse(save.value)) {
      var url = Uri.parse('${ApiEndPoints.baseUrl}${ApiEndPoints.saveJobApi.DELETE_SAVE_JOB}${job_id.value}/${ApplicationController.user_id}');
      final response = await http.delete(url,headers: headers);
      save.value = 'false';
    } else {
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.saveJobApi.SAVE_JOB);
      Map body = {
        'candidate_id':ApplicationController.user_id,
        'job_id':job_id.value
      };
      final response = await http.post(url,body: jsonEncode(body),headers: headers);
      save.value = 'true';
    }
    homController.getListSaveJobId();
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
   getInterviews();
   getCompany();
   getJobs();
  }

  void HandleApplyJobPage () {
    Get.toNamed(AppRoutes.APPLYJOB,parameters: {'job_id':job_id.value,'company_id':company_id.value});
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}