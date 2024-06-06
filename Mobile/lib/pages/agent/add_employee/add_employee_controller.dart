import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/common/agent.dart';
import 'package:jobpilot_app/pages/application/application_controller.dart';
import 'package:jobpilot_app/pages/agent/employee/employee_controller.dart';

import '../../../common/api/api_backend.dart';
import '../../../common/colors/colors.dart';

class AddEmployeeController extends GetxController {
  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var textController4 = TextEditingController();
  var obscureText1_ = true.obs;
  var obscureText2_ = true.obs;
  var employeeController = Get.find<EmployeeController>();
  void ClickVisible1(){
    if(obscureText1_.value) {obscureText1_.value = false;}
    else {obscureText1_.value = true;}
  }
  void ClickVisible2(){
    if(obscureText2_.value) {obscureText2_.value = false;}
    else {obscureText2_.value = true;}
  }

  bool checkValidate (){
    return true;
  }

  Future<void> addEmployee(BuildContext context) async {
    String agent_name = textController1.text.toString();
    String agent_email = textController2.text.toString();
    String agent_password = textController3.text.toString();
    String agent_password_confirm = textController4.text.toString();
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ApiEndPoints.authAccount.REGISTER_AGENT);
      int status = 1;
      Agent agent = Agent(int.parse(ApplicationController.company_id), agent_name, agent_email, agent_password, status, password_confirmation: agent_password_confirm);
      showLoaderDialog(context);
      http.Response response = await http.post(url,body: jsonEncode(agent.toJson()),headers: headers);
      employeeController.getListAgents();
      await Future.delayed(const Duration(seconds: 2));
      if(response.statusCode == 200) {
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
