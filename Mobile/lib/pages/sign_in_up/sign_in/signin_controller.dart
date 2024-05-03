import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:http/http.dart' as http;
import '../../../common/api/api_backend.dart';
import '../../../common/routes/names.dart';

class SignInController extends GetxController {
  var text1Controller = TextEditingController();
  var text2Controller = TextEditingController();
  var obscureText_ = true.obs;
  var value_ = 0.obs;
  void ActionRadio(int index) {
    value_.value = index;
  }
  void ClickVisible(){
    if(obscureText_.value) {obscureText_.value = false;}
    else {obscureText_.value = true;}
  }
  Future<void> signInCandidate(BuildContext context) async {
    String email = text1Controller.text.toString();
    String password = text2Controller.text.toString();
    try {
      var headers = {'Content-Type' : 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl+(value_.value == 1?ApiEndPoints.authAccount.SIGNIN_CANDIDATE:ApiEndPoints.authAccount.SIGNIN_AGENT));
      Map body = {
        'email' : email,
        'password' : password
      };
      showLoaderDialog(context);
      http.Response response = await http.post(url,body: jsonEncode(body),headers: headers);
      await Future.delayed(const Duration(seconds: 2));
      if(response.statusCode == 200) {
        print(jsonDecode(response.body)['message']??'SignIn Sucessfully');
        Navigator.pop(context);
        HandleHomePage();
      } else if(response.statusCode == 404) {
        Navigator.pop(context);
      }
      text1Controller.clear();
      text2Controller.clear();
    } catch (e) {
      print(e);
    }
  }

  void HandlePageSignup(){
    Get.toNamed(AppRoutes.SIGNUP);
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

  void HandleHomePage() {
    Get.toNamed(AppRoutes.APPLICATION);
  }

}

  