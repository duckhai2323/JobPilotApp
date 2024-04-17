
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/common/api/api_backend.dart';
import 'package:jobpilot_app/common/candidate.dart';
import '../../../common/colors/colors.dart';
import '../../../common/routes/names.dart';

class SignUpController extends GetxController{
  var text1Controller = TextEditingController();
  var text2Controller = TextEditingController();
  var text3Controller = TextEditingController();
  var text4Controller = TextEditingController();
  var obscureText1_ = true.obs;
  var obscureText2_ = true.obs;
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

  Future<void> registerCandidate(BuildContext context) async {
    String candidate_name = text1Controller.text.toString();
    String candidate_email = text2Controller.text.toString();
    String candidate_password = text3Controller.text.toString();
    String candidate_password_confirm = text4Controller.text.toString();
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+ApiEndPoints.authAccount.REGISTER_CANDIDATE);
      int status = 1;
      Candidate candidate = Candidate(candidate_name, candidate_email, candidate_password, status);
      showLoaderDialog(context);
      http.Response response = await http.post(url,body: jsonEncode(candidate.toJson()),headers: headers);
      await Future.delayed(const Duration(seconds: 2));
      if(response.statusCode == 200) {
        Navigator.pop(context);
        HandlePageSignIn();
      }
      text1Controller.clear();
      text2Controller.clear();
      text3Controller.clear();
      text4Controller.clear();
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

  void HandlePageSignIn(){
    Get.toNamed(AppRoutes.SIGNIN);
  }
}