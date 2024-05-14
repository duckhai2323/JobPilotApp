
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/common/interview.dart';
import 'package:jobpilot_app/common/item_add_edit/item_add_interview.dart';
import 'package:jobpilot_app/common/job_detail.dart';
import 'package:jobpilot_app/pages/agent/company_infor/company_infor_controller.dart';
import 'package:jobpilot_app/pages/agent/jobfair/jobfair_controller.dart';
import 'package:jobpilot_app/pages/application/application_controller.dart';

import '../../../common/api/api_backend.dart';
import '../../../common/colors/colors.dart';

class AddJobController extends GetxController {
  DateTime date = DateTime(2024, 5, 20);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  var companyController = Get.find<CompanyInforController>();
  var jobfairController = Get.find<JobFairControlelr>();

  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var textController4 = TextEditingController();
  var textController5 = TextEditingController();
  var textController6 = TextEditingController();
  var textController7 = TextEditingController();
  var textController8 = TextEditingController();
  var textController9 = TextEditingController();
  var textController10 = TextEditingController();

  List<ItemAddInterview> listInterview = <ItemAddInterview>[ItemAddInterview(TextEditingController(), 'Chọn ngày/tháng/năm')].obs;

  void showDialogTime (BuildContext context, int index,String type) {
    return _showDialog(
        CupertinoDatePicker(
          initialDateTime: date,
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          onDateTimeChanged: (DateTime newDate) {
            date = newDate;
            if(type == "deadline") {
              textController10.text = '${date.day}/${date.month}/${date.year}';
            } else {
              ItemAddInterview temp = listInterview[index];
              listInterview.removeAt(index);
              listInterview.insert(index, ItemAddInterview(temp.textEditingController,'${date.day}/${date.month}/${date.year}'));
            }
          },
        ),context
    );
  }

  void _showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  Future<void> addJobDetail(BuildContext context) async {
    try {
      showLoaderDialog(context);
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobApi.ADD_JOB_DETAIL);
      JobDetail jobDetail = JobDetail(
        int.parse(ApplicationController.company_id),
        textController1.text.toString(),
        textController5.text.toString(),
        textController6.text.toString(),
        textController7.text.toString(),
        textController2.text.toString(),
        textController3.text.toString(),
        int.parse(textController9.text.toString()),
        textController4.text.toString(),
        textController8.text.toString(),
        1,
        textController10.text.toString(),
      );

      final response = await http.post(url,body:jsonEncode(jobDetail.toJson()),headers: headers);
      if(response.statusCode == 200) {
        var url_interview = Uri.parse(ApiEndPoints.baseUrl+ApiEndPoints.interviewApi.INTERVIEW_CREATE);
        var job_id = jsonDecode(response.body)['job_id'];
        for(var element in listInterview) {
          Interview interview = Interview(
              job_id,
              element.textEditingController.text.toString(),
              listInterview.indexOf(element) + 3,
              element.testDate,
              0
          );

          final response = await http.post(
              url_interview, body: jsonEncode(interview.toJson()),
              headers: headers);
        }
        companyController.getJobs();
        jobfairController.getJobs();
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pop(context);
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


  void addInterView() {
    listInterview.add(ItemAddInterview(TextEditingController(), 'Chọn ngày/tháng/năm'));
  }

  void cancelInterview(int index) {
    listInterview.removeAt(index);
  }
}