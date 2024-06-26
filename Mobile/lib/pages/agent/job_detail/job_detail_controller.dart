import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/common/candidate.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/common/interview.dart';
import 'package:jobpilot_app/common/item_object/item_candidate_jobfair.dart';
import 'package:jobpilot_app/pages/agent/company_infor/company_infor_controller.dart';
import 'package:jobpilot_app/pages/agent/jobfair/jobfair_controller.dart';
import 'package:jobpilot_app/pages/application/application_controller.dart';
import '../../../common/api/api_backend.dart';
import '../../../common/api/chat/msg.dart';
import '../../../common/item_add_edit/item_add_interview.dart';
import '../../../common/item_object/item_job_detail.dart';
import '../../../common/job_detail.dart';
import '../../../common/notification.dart';
import '../../../common/routes/names.dart';

class JobDetailAgentController extends GetxController with GetSingleTickerProviderStateMixin {
  final db = FirebaseFirestore.instance;
  var listener;
  List<JobDetail> jobDetails = <JobDetail>[].obs;
  List<Interview> interviews = <Interview>[].obs;
  List<ItemCandidateApply> candidates = <ItemCandidateApply>[].obs;
  List<ItemColor> listButton = <ItemColor>[].obs;
  var jobFairController = Get.find<JobFairControlelr>();
  late TabController tabController;
  final stateTab = 0.obs;
  final job_id = ''.obs;
  final tabTitle = ''.obs;
  final firebase = FirebaseFirestore.instance;
  var companyInfor = Get.find<CompanyInforController>();

  @override
  onInit(){
    super.onInit();
    job_id.value = Get.parameters['job_id']??"";
    tabController = TabController(length: 3, vsync: this);
    getJobDetail();
    getInterviews();
    getCandidates();
  }

  Future<void> ClickItemChat(ItemCandidateApply to_user) async {
    String checkFist = 'false';
    String doc_id="";

    var from_messages = await db.collection("message").withConverter(
        fromFirestore:Msg.fromFirestore,
        toFirestore: (Msg msg, options) => msg.toFirestore()
    ).where(
        "from_email", isEqualTo: ApplicationController.user_email
    ).where("to_email",isEqualTo: to_user.candidate_email).get();

    var to_messages = await db.collection("message").withConverter(
        fromFirestore:Msg.fromFirestore,
        toFirestore: (Msg msg, options) => msg.toFirestore()
    ).where(
        "from_email", isEqualTo: to_user.candidate_email
    ).where("to_email",isEqualTo: ApplicationController.user_email).get();

    if(from_messages.docs.isNotEmpty || to_messages.docs.isNotEmpty){
      checkFist = 'true';
      if(from_messages.docs.isNotEmpty){doc_id = from_messages.docs.first.id;}
      if(to_messages.docs.isNotEmpty){doc_id = to_messages.docs.first.id;}
    }
    Get.toNamed(AppRoutes.CHAT,parameters: {"to_email": to_user.candidate_email??"","to_name":to_user.candidate_name??"","to_avatar":to_user.candidate_image??"","check_first":checkFist??"","doc_id":doc_id??""});
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
        switch(jobDetails[0].status) {
          case 0: {
            tabTitle.value = 'Kết quả';
          }
          break;
          case 1: {
            tabTitle.value = 'Vòng ứng tuyển';
          }
          break;
          case 2: {
            tabTitle.value = 'Vòng loại hồ sơ';
          }
          break;
          default: {
            interviews.forEach((element) {
              if(element.index == jobDetails[0].status) {
                tabTitle.value = element.interview_type;
                return;
              }
            });
            break;
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCandidates() async {
    candidates.clear();
    listButton.clear();
    try{
      var headers = {'Content-TYpe':'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobFairApi.JOBFAIR_GET_CANDIDATES+job_id.value);
      final response = await http.get(url,headers: headers);
      if(response.statusCode ==  200) {
        candidates.addAll((jsonDecode(response.body) as List).map((e) {
          listButton.add(ItemColor(ItemCandidateApply.fromJson(e).candidate_email,ItemCandidateApply.fromJson(e).job_fair_id, AppColors.primaryColor1, Colors.red, 0));
          return ItemCandidateApply.fromJson(e);
        }).toList());

      } else {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }

  void ClickButtonSubmit (int job_fair_id,String key) {
    var item = listButton.firstWhere((element) => element.job_fair_id == job_fair_id);
    if(item.status == 0) {
      int index = listButton.indexOf(item);
      if(key=='pass') {
        item.status = 1;
        item.passColor =  Colors.grey.shade400;
        listButton.removeAt(index);
        listButton.insert(index, item);
      } else {
        item.status = 2;
        item.failColor =  Colors.grey.shade400;
        listButton.removeAt(index);
        listButton.insert(index, item);
      }
    }
  }

  Future<void> updateStatusJob(BuildContext context) async {
    showLoaderDialog(context);
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobApi.UPDATE_STATUS_JOB+job_id.value);
      final response = await http.put(url,headers: headers);
      if(response.statusCode == 200) {
        for(var element in listButton) {
          String documentId = firebase.collection("notifications").doc().id;
          var data = Notification1(companyInfor.companies[0].company_name, element.status == 1?'Xin chúc mừng bạn đã qua vòng ' + tabTitle.value:'Hẹn gặp bạn trong đợt tuyển dụng tiếp theo, chúc bạn thành công !', element.candidate_email, false);
          await firebase.collection('notifications').withConverter(
            fromFirestore: Notification1.fromFirestore,
            toFirestore: (Notification1 notification1, options)=>notification1.toFirestore(),
          ).doc(documentId).set(data);
          if(element.status == 2 || element.status == 0) {
            var url_jobfair = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobFairApi.JOBFAIR_UPDATE_STATUS+element.job_fair_id.toString());
            Map statusMap = {
              'status' : 0,
            };
            final response = await http.put(url_jobfair, body: jsonEncode(statusMap),headers: headers);
          }
        }
        getJobDetail();
        getInterviews();
        getCandidates();
        jobFairController.getJobs();
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pop(context);
      } else {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }

  void onPageChange(int index) {
    tabController.animateTo(index);
    stateTab.value = index;
  }

  void showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 15),child:Text("Loading...", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: AppColors.primaryColor1), )),
        ],),
    );
    showDialog(
      barrierDismissible: true,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

}


class ItemColor {
  String candidate_email;
  int job_fair_id;
  Color passColor;
  Color failColor;
  int status;

  ItemColor(this.candidate_email,this.job_fair_id,this.passColor,this.failColor,this.status);
}