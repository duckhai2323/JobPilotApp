
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:jobpilot_app/common/api/api_backend.dart';
import 'package:jobpilot_app/common/candidate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/colors/colors.dart';
import '../../../common/routes/names.dart';

class SignUpController extends GetxController{
  Future<void> registerCandidate(BuildContext context,String candidate_name, String candidate_email, String candidate_password) async {
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