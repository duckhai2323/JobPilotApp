
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/application/application_controller.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';
import '../../../common/api/api_backend.dart';
import '../../../common/colors/colors.dart';
import '../../application/home/home_controller.dart';

class ApplyJobController extends GetxController {
  final job_id = ''.obs;
  final company_id = ''.obs;
  var homController = Get.find<HomeController>();
  var jobDetailController = Get.find<JobDetailsController>();


  @override
  onInit() {
    super.onInit();
    job_id.value = Get.parameters['job_id']??"";
    company_id.value = Get.parameters['company_id']??"";
  }

  Future<void> applyJob(BuildContext context) async {
    try {
      showLoaderDialog(context);
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobFairApi.JOBFAIR_APPLLY);
      Map jobFair = {
        'candidate_id':int.parse( ApplicationController.user_id),
        'company_id' : int.parse(company_id.value),
        'job_id' :int.parse(job_id.value),
        'status':1,
        'status_offer':0,
      };
      print(jobFair);
      final response = await http.post(url,body:jsonEncode(jobFair),headers: headers);
      if(response.statusCode == 200) {
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pop(context);
        homController.getListApplyJobId();
        homController.getListJobsApply();
        jobDetailController.apply.value = 'true';
        Get.back();
      } else {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
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
