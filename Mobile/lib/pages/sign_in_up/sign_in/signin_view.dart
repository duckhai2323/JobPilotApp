import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/common/routes/names.dart';
import 'package:jobpilot_app/pages/application/home/home_view.dart';
import 'package:jobpilot_app/pages/sign_in_up/sign_in/signin_controller.dart';

class SignInPage extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 5),
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
                  padding: EdgeInsets.only(top: 25, bottom: 10),
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: controller.text1Controller,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: AppColors.primaryColor2),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      filled: true,
                      fillColor: AppColors.bgTextFeild,
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          color: AppColors.placeHolderColor,
                          fontSize: 16,
                          fontFamily: "Roboto Regular",
                          fontWeight: FontWeight.w600),
                      prefixIcon: const Icon(Icons.email_outlined,
                          size: 20, color: AppColors.placeHolderColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                              color: AppColors.bgTextFeild, width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                              color: AppColors.primaryColor1, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                              color: AppColors.bgTextFeild, width: 1.0)),
                    ),
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: TextFormField(
                      controller: controller.text2Controller,
                      obscureText: controller.obscureText_.value,
                      keyboardType: TextInputType.visiblePassword,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: AppColors.primaryColor2),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        filled: true,
                        fillColor: AppColors.bgTextFeild,
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            color: AppColors.placeHolderColor,
                            fontSize: 16,
                            fontFamily: "Roboto Regular",
                            fontWeight: FontWeight.w600),
                        prefixIcon: const Icon(Icons.lock_outline,
                            size: 20, color: AppColors.placeHolderColor),
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.ClickVisible();
                          },
                          child: Icon(
                            controller.obscureText_.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                            size: 23,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: AppColors.bgTextFeild, width: 1.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: AppColors.primaryColor1, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: AppColors.bgTextFeild, width: 1.0)),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: controller.value_.value,
                          onChanged: (value) {
                            controller.ActionRadio(value!);
                          },
                        ),
                        const Text(
                          'Ứng viên ',
                          style: TextStyle(
                              color: AppColors.placeHolderColor,
                              fontSize: 16,
                              fontFamily: "Roboto Regular",
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: 2,
                          groupValue: controller.value_.value,
                          onChanged: (value) {
                            controller.ActionRadio(value!);
                          },
                        ),
                        const Text(
                          'Nhà tuyển dụng',
                          style: TextStyle(
                              color: AppColors.placeHolderColor,
                              fontSize: 16,
                              fontFamily: "Roboto Regular",
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor1),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //controller.signInCandidate(context);
                    Get.toNamed(AppRoutes.APPLICATION,parameters: {'user_id':'1','user_image':'','user_name':'Vu Hung','user_position':'candidate'});
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor1,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          )
                        ]),
                    child: const Center(
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Hoặc đăng nhập bằng',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.placeHolderColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 1, color: AppColors.placeHolderColor)),
                        child: Image.asset(
                          'assets/images/facebook-logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                                width: 1, color: AppColors.placeHolderColor)),
                        child: Image.asset(
                          'assets/images/google-logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                                width: 1, color: AppColors.placeHolderColor)),
                        child: Image.asset(
                          'assets/images/linkedin-logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.HandlePageSignup();
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Bạn chưa có tài khoản? ',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryColor2,
                        fontWeight: FontWeight.w500,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Đăng ký ngay',
                            style: TextStyle(
                              color: AppColors.primaryColor1,
                            )),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 8),
                  child: Divider(),
                ),
                const Text(
                  'Trải nghiệm không cần tài đăng nhập',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor1),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            )),
      ),
    );
  }
}
