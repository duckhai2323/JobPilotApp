
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
import 'package:jobpilot_app/pages/agent/job_detail/job_detail_controller.dart';
import 'package:jobpilot_app/pages/application/application_controller.dart';

import '../../../common/api/api_backend.dart';
import '../../../common/colors/colors.dart';

class EditJobController extends GetxController with GetSingleTickerProviderStateMixin {
  DateTime date = DateTime(2024, 5, 20);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  var priorInterviewAmount = 0;
  var companyController = Get.find<CompanyInforController>();
  var jobfairController = Get.find<JobFairControlelr>();
  // var jobDetailController = Get.find<JobDetailAgentController>();

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

  final job_id = ''.obs;
  List<Interview> interviews = <Interview>[].obs;

  List<ItemAddInterview> listInterview = <ItemAddInterview>[ItemAddInterview(TextEditingController(), 'Chọn ngày/tháng/năm')].obs;

  @override
  onInit() {
    super.onInit();
    job_id.value = Get.parameters['job_id']??"";
    getCurrentJob();
    getInterviews();
  }


  void showDialogTime (BuildContext context, int index,String type, String _date) {
    var day = '20';
    var month = '5';
    var year = '2024';
    if(_date != null) {
      final currentDate = _date.split('/');
      day = currentDate[0];
      month = currentDate[1];
      year = currentDate[2];
    }
    return _showDialog(
        CupertinoDatePicker(
          initialDateTime: DateTime(int.parse(year), int.parse(month), int.parse(day)),
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

  Future<void> getCurrentJob() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobApi.JOB_DETAIL+ job_id.value);
      final response = await http.get(url, headers: headers);
      if(response.statusCode == 200) {
        JobDetail jobdetail = JobDetail.fromJson(jsonDecode(response.body));
        textController1.text = jobdetail.job_title;
        textController2.text = jobdetail.salary;
        textController3.text = jobdetail.job_location;
        textController4.text = jobdetail.experience_require;
        textController5.text = jobdetail.job_details;
        textController6.text = jobdetail.job_require;
        textController7.text = jobdetail.job_benefit;
        textController8.text = jobdetail.work_form;
        textController9.text = jobdetail.candidate_number.toString();
        textController10.text = jobdetail.deadline_job;
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch(e) {
      print(e);
    }
  }

  Future<void> getInterviews() async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.interviewApi.INTERVIEW_GET+ job_id.value);
      final response = await http.get(url, headers: headers);
      if(response.statusCode == 200) {
        interviews.addAll((jsonDecode(response.body) as List).map((e) => Interview.fromJson(e)).toList());
        if(interviews.length > 0) {
          listInterview.clear();
          priorInterviewAmount = interviews.length;
          for(var element in interviews) {
            listInterview.add(ItemAddInterview(
                TextEditingController(), element.interview_date));
            listInterview.last.textEditingController.text =
                element.interview_type;
          }
        }
      } else if(response.statusCode == 404) {
        print('404 not found');
      }
    } catch(e) {
      print(e);
    }
  }

  Future<void> updateJobDetail(BuildContext context) async {
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.jobApi.UPDATE_JOB+job_id.value);
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
      showLoaderDialog(context);
      final response = await http.put(url,body:jsonEncode(jobDetail.toJson()),headers: headers);
      if(response.statusCode == 200) {
        if(listInterview.length == priorInterviewAmount) {
          for (var element in listInterview) {
            var url_update = Uri.parse(ApiEndPoints.baseUrl +
                ApiEndPoints.interviewApi.INTERVIEW_UPDATE +
                interviews[listInterview.indexOf(element)].interview_id
                    .toString());
            Interview interview = Interview(
                int.parse(job_id.value),
                element.textEditingController.text.toString(),
                listInterview.indexOf(element) + 3,
                element.testDate,
                1
            );

            final response = await http.put(
                url_update, body: jsonEncode(interview.toJson()),
                headers: headers);
            print(url_update.toString());
            // if(response.statusCode == 200) print("Oke");
            // else print("DM Cuoc Doi");
          }
        } else if(listInterview.length > priorInterviewAmount) {
          for (var element in listInterview) {
            if(listInterview.indexOf(element) < priorInterviewAmount) {
              var url_update = Uri.parse(ApiEndPoints.baseUrl +
                  ApiEndPoints.interviewApi.INTERVIEW_UPDATE +
                  interviews[listInterview.indexOf(element)].interview_id
                      .toString());
              Interview interview = Interview(
                  int.parse(job_id.value),
                  element.textEditingController.text.toString(),
                  listInterview.indexOf(element) + 3,
                  element.testDate,
                  1
              );

              final response = await http.put(
                  url_update, body: jsonEncode(interview.toJson()),
                  headers: headers);
            } else {
              var url_add = Uri.parse(ApiEndPoints.baseUrl +
                  ApiEndPoints.interviewApi.INTERVIEW_CREATE);
              Interview interview = Interview(
                  int.parse(job_id.value),
                  element.textEditingController.text.toString(),
                  listInterview.indexOf(element) + 3,
                  element.testDate,
                  0
              );

              final response = await http.post(
                  url_add, body: jsonEncode(interview.toJson()),
                  headers: headers);
            }
          }
        } else {
          for (var element in listInterview) {
            var url_update = Uri.parse(ApiEndPoints.baseUrl +
                ApiEndPoints.interviewApi.INTERVIEW_UPDATE +
                interviews[listInterview.indexOf(element)].interview_id
                    .toString());
            Interview interview = Interview(
                int.parse(job_id.value),
                element.textEditingController.text.toString(),
                listInterview.indexOf(element) + 3,
                element.testDate,
                1
            );

            final response = await http.put(
                url_update, body: jsonEncode(interview.toJson()),
                headers: headers);
          }
          for (var element in interviews) {
            if(interviews.indexOf(element) >= listInterview.length) {
              var url_delete = Uri.parse(ApiEndPoints.baseUrl +
                  ApiEndPoints.interviewApi.INTERVIEW_DELETE +
                  element.interview_id
                      .toString());
              final response = await http.delete(url_delete, headers: headers);
            }
          }
        }
        companyController.getJobs();
        jobfairController.getJobs();
        // jobDetailController.getJobDetail();
        // jobDetailController.getInterviews();

        await Future.delayed(const Duration(seconds: 1));
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