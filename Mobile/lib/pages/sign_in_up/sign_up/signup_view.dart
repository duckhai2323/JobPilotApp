import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/candidate.dart';
import 'package:jobpilot_app/pages/sign_in_up/sign_up/signup_controller.dart';

import '../../../common/colors/colors.dart';

class SignUpPage extends GetView<SignUpController> {

  @override
  Widget build(BuildContext context) {
    var text1Controller = TextEditingController();
    var text2Controller = TextEditingController();
    var text3Controller = TextEditingController();
    var text4Controller = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60,bottom: 5),
              child: SizedBox(
                width: 135,
                height: 112,
                child: Image.asset(
                  'assets/images/app-logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const Text(
              'Chào mừng bạn đến với JobPilot',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor2,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Đăng ký',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor2
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: TextFormField(
                autofocus: true,
                controller: text1Controller,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.primaryColor2
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  filled: true,
                  fillColor: AppColors.bgTextFeild,
                  hintText: 'Họ và tên',
                  hintStyle: const TextStyle(color: AppColors.placeHolderColor,fontSize: 16,fontFamily: "Roboto Regular", fontWeight: FontWeight.w600),
                  prefixIcon: const Icon(Icons.perm_identity_sharp,size: 20,color: AppColors.placeHolderColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: AppColors.bgTextFeild,
                          width: 1.0
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor1,
                          width: 1.0
                      )
                  ),

                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: AppColors.bgTextFeild,
                          width: 1.0
                      )
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                autofocus: true,
                controller: text2Controller,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.primaryColor2
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  filled: true,
                  fillColor: AppColors.bgTextFeild,
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: AppColors.placeHolderColor,fontSize: 16,fontFamily: "Roboto Regular", fontWeight: FontWeight.w600),
                  prefixIcon: const Icon(Icons.email_outlined,size: 20,color: AppColors.placeHolderColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: AppColors.bgTextFeild,
                          width: 1.0
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor1,
                          width: 1.0
                      )
                  ),

                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: AppColors.bgTextFeild,
                          width: 1.0
                      )
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: TextFormField(
                autofocus: true,
                controller: text3Controller,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.primaryColor2
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  filled: true,
                  fillColor: AppColors.bgTextFeild,
                  hintText: 'Mật khẩu',
                hintStyle: const TextStyle(color: AppColors.placeHolderColor,fontSize: 16,fontFamily: "Roboto Regular", fontWeight: FontWeight.w600),
                  prefixIcon: const Icon(Icons.lock_outline,size: 20,color: AppColors.placeHolderColor),
                  suffixIcon: Icon(Icons.visibility_off_outlined,color: AppColors.placeHolderColor,size: 23,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: AppColors.bgTextFeild,
                          width: 1.0
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor1,
                          width: 1.0
                      )
                  ),

                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: AppColors.bgTextFeild,
                          width: 1.0
                      )
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                autofocus: true,
                controller: text4Controller,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.primaryColor2
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  filled: true,
                  fillColor: AppColors.bgTextFeild,
                  hintText: 'Nhập lại mật khẩu',
                  hintStyle: const TextStyle(color: AppColors.placeHolderColor,fontSize: 16,fontFamily: "Roboto Regular", fontWeight: FontWeight.w600),
                  prefixIcon: const Icon(Icons.lock_outline,size: 20,color: AppColors.placeHolderColor),
                  suffixIcon: Icon(Icons.visibility_off_outlined,color: AppColors.placeHolderColor,size: 23,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: AppColors.bgTextFeild,
                          width: 1.0
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor1,
                          width: 1.0
                      )
                  ),

                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                          color: AppColors.bgTextFeild,
                          width: 1.0
                      )
                  ),
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 35,right:35,top: 20),
              child: RichText(
                text: const TextSpan(
                  text: 'Tôi đã đọc và đồng ý với ',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor2,
                    fontWeight: FontWeight.w500,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Điều khoản dịch vụ ', style: TextStyle(color: AppColors.primaryColor1,)),
                    TextSpan(text: 'và ', style: TextStyle(color: AppColors.primaryColor2,)),
                    TextSpan(text: 'Chính sách bảo mật ', style: TextStyle(color: AppColors.primaryColor1,)),
                    TextSpan(text: 'của JobPilot', style: TextStyle(color: AppColors.primaryColor1,)),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                controller.registerCandidate(context,text1Controller.text.toString(),text2Controller.text.toString(), text3Controller.text.toString());
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                margin:EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor1,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0,1),
                      )
                    ]
                ),
                child: const Center(
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: (){
                controller.HandlePageSignIn();
              },
              child: RichText(
                text: const TextSpan(
                  text: 'Bạn đã có tài khoản? ',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor2,
                    fontWeight: FontWeight.w500,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Đăng nhập ngay', style: TextStyle(color: AppColors.primaryColor1,)),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70,vertical: 8),
              child: Divider(),
            ),

            const Text(
              'Trải nghiệm không cần tài đăng nhập',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor1
              ),
            ),

            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}