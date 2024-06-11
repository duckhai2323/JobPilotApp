import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/university.dart';
import 'package:jobpilot_app/pages/application/application_controller.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/topcv_profile_controller.dart';


import '../../../../../../common/api/api_backend.dart';
import '../../../../../../common/colors/colors.dart';

class AddAcademicController extends GetxController {
  DateTime date = DateTime(2024, 5, 20);

  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var textController4 = TextEditingController();
  var textController5 = TextEditingController();

  var topcvController = Get.find<TopCVProfileController>();

  var isChecked = false.obs;
  void ClickBox() {
    if(isChecked.value) {isChecked.value = false;}
    else {isChecked.value = true;}
  }

  void showDialogTime (BuildContext context, String type) {
    return _showDialog(
        CupertinoDatePicker(
          initialDateTime: date,
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          onDateTimeChanged: (DateTime newDate) {
            date = newDate;
            if(type == "start") {
              textController3.text = '${date.day}/${date.month}/${date.year}';
            } else if(type == "end"){
              textController4.text = '${date.day}/${date.month}/${date.year}';
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

  Future<void> addUniver( BuildContext context) async {
    String univer_name = textController1.text.toString();
    String specialized = textController2.text.toString();
    String start_uni = textController3.text.toString();
    String end_uni = textController4.text.toString();
    String description = textController5.text.toString();
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ApiEndPoints.univerAPi.ADD_UNIVER);
      University university = University(int.parse(ApplicationController.user_id), univer_name, specialized, start_uni, end_uni, description);
      showLoaderDialog(context);
      http.Response response = await http.post(url,body: jsonEncode(university.toJson()),headers: headers);
      await Future.delayed(const Duration(seconds: 2));
      if(response.statusCode == 200) {
        topcvController.getListUniversities();
        Navigator.pop(context);
        Get.back();
      }
      textController1.clear();
      textController2.clear();
      textController3.clear();
      textController4.clear();
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
    showDialog(barrierDismissible: true,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}
