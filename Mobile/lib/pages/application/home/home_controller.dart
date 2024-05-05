import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';

class HomeController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  final statePageView = 0.obs;
  void ChangePageView (int page) {
    statePageView.value = page;
  }
  void HandleNotifiPage () {
    Get.toNamed(AppRoutes.NOTIFICATION);
  }

  void HandleJobdetails () {
    Get.toNamed(AppRoutes.JOBDETAILS);
  }

  void HandleCompaniesPage () {
    Get.toNamed(AppRoutes.COMPANIES);
  }

  void HandleSuitableJobPage () {
    Get.toNamed(AppRoutes.SUITABLE_JOB);
  }

}