import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/colors/colors.dart';

class ApplicationController extends GetxController{
  static late String id;
  static late String image;
  static late String username;
  final position = ''.obs;
  ApplicationController();
  final state = 0.obs;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTab;
  late final List<BottomNavigationBarItem> bottomTabAdmin;

  @override
  void onInit() {
    super.onInit();
    id = Get.parameters['id']??"";
    image = Get.parameters['image']??"";
    username = Get.parameters['username']??"";
    position.value = Get.parameters['position']??"";
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

      const BottomNavigationBarItem(
        icon: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 16,
          child: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage('https://yt3.googleusercontent.com/v-fHSvLthvdRlrtXeEbWc1JtuKPa7yUeG668kRdxbX6XAxcw_rlhf8wjRGxht_oepo49SkwnXA=s900-c-k-c0x00ffffff-no-rj'),
          ),
        ),

        activeIcon: CircleAvatar(
          backgroundColor: AppColors.primaryColor1,
          radius: 16,
          child: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage('https://yt3.googleusercontent.com/v-fHSvLthvdRlrtXeEbWc1JtuKPa7yUeG668kRdxbX6XAxcw_rlhf8wjRGxht_oepo49SkwnXA=s900-c-k-c0x00ffffff-no-rj'),
          ),
        ),
        label: 'Tài khoản',
        backgroundColor: Colors.transparent,
      ),
    ];

    bottomTabAdmin = <BottomNavigationBarItem> [
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
          CupertinoIcons.heart,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.heart_solid,
          color: AppColors.primaryColor1,
          size: 25,
        ),
        label: 'Favorite',
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
          Icons.phone_in_talk_outlined,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          Icons.phone_in_talk,
          color: AppColors.primaryColor1,
          size: 25,
        ),
        label: 'Hotline',
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