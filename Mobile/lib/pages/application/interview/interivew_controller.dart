import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/application/application_controller.dart';

import '../../../common/api/api_backend.dart';
import '../../../common/colors/colors.dart';
import '../../../common/item_object/item_job_apply.dart';
import 'package:http/http.dart' as http;

import '../../../common/routes/names.dart';
import '../home/home_controller.dart';

class InterviewController extends GetxController {
  var homController = Get.find<HomeController>();

  void showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 15),child:const Text("Loading...", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: AppColors.primaryColor1), )),
        ],),
    );
    showDialog(barrierDismissible: true,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  Future<void> updateStatusOffer(BuildContext context,int job_fair_id, int index) async {
    showLoaderDialog(context);
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url_jobfair = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobFairApi.JOBFAIR_UPDATE_STATUS_OFFER+job_fair_id.toString());
      Map statusMap = {
        'status_offer' : index,
      };
      final response = await http.put(url_jobfair, body: jsonEncode(statusMap),headers: headers);
      if(response.statusCode == 200) {
        homController.getListJobsApply();
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pop(context);
      } else {
        print('404 not found');
      }
    } catch (e) {
      print(e);
    }
  }
}