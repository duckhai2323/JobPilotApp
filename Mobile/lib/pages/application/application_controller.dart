import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/colors/colors.dart';

class ApplicationController extends GetxController{
  static late String user_id;
  static late String user_image;
  static late String user_name;
  static late String user_email;
  static late String company_id;
  final position = ''.obs;
  ApplicationController();
  final state = 0.obs;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTab;
  late final List<BottomNavigationBarItem> bottomTabAgent;

  @override
  void onInit() {
    super.onInit();
    user_id = Get.parameters['user_id']??"";
    user_image = Get.parameters['user_image']??"";
    user_name = Get.parameters['user_name']??"";
    user_email = Get.parameters['user_email']??"";
    company_id = Get.parameters['company_id']??"";
    position.value = Get.parameters['user_position']??"";
    bottomTab = <BottomNavigationBarItem> [
      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.house_fill,
          color: AppColors.primaryColor1,
          size: 25,
        ),
        label: 'Home',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.doc,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.doc_fill,
          color: AppColors.primaryColor1,
          size: 25,
        ),
        label: 'CV & Profile',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.chat_bubble_text,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.chat_bubble_text_fill,
          color: AppColors.primaryColor1,
          size: 25,
        ),

        label: 'Chat',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.question_answer_outlined,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          Icons.question_answer,
          color: AppColors.primaryColor1,
          size: 25,
        ),
        label: 'Phỏng vấn',
        backgroundColor: Colors.transparent,
      ),

      BottomNavigationBarItem(
        icon: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 16,
          child: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(user_image),
          ),
        ),

        activeIcon: CircleAvatar(
          backgroundColor: AppColors.primaryColor1,
          radius: 16,
          child: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(user_image),
          ),
        ),
        label: 'Tài khoản',
        backgroundColor: Colors.transparent,
      ),
    ];

    bottomTabAgent = <BottomNavigationBarItem> [

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.business_outlined,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          Icons.business,
          color: AppColors.primaryColor1,
          size: 25,
        ),
        label: 'Company',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.question_answer_outlined,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          Icons.question_answer_outlined,
          color: AppColors.primaryColor1,
          size: 25,
        ),
        label: 'JobFair',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.person_2,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.person_2_fill,
          color: AppColors.primaryColor1,
          size: 25,
        ),
        label: 'Employee',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.chat_bubble_text,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.chat_bubble_text_fill,
          color: AppColors.primaryColor1,
          size: 25,
        ),

        label: 'Chat',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.perm_identity,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          Icons.person,
          color: AppColors.primaryColor1,
          size: 25,
        ),
        label: 'Profile',
        backgroundColor: Colors.transparent,
      ),
    ];

    pageController = PageController(initialPage: state.value);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void handPageChanged(int index) {
    state.value = index;
  }

  void handNavBarTap(int index) {
    pageController.jumpToPage(index);
  }
}