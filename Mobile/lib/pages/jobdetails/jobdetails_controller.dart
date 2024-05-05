import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';

class JobDetailsController extends GetxController{
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
  PageController pageController = PageController(initialPage: 0);
  final statePageView = 0.obs;
  void ChangePageView (int page) {
    statePageView.value = page;
  }
  void RevertPageView (){
    if(statePageView.value != 0) {
      pageController.animateToPage(statePageView.value-1, duration: const Duration(microseconds: 300), curve: Curves.decelerate);
    }
  }
  void NextPageView (){
    if(statePageView.value < 6) {
      pageController.animateToPage(statePageView.value+1, duration: const Duration(microseconds: 300), curve: Curves.decelerate);
    }
  }
  @override
  void onInit() {
    super.onInit();

    scrollController = ScrollController()
      ..addListener(() {
        isSliverAppBarExpanded.value = isSliverAppBarExpandedCheck();
      });
  }
  bool isSliverAppBarExpandedCheck () {
    return scrollController.hasClients &&
        scrollController.offset > 350;
  }

  void HandleJobdetails () {
    Get.toNamed(AppRoutes.JOBDETAILS);
  }

  void HandleApplyJobPage () {
    Get.toNamed(AppRoutes.APPLYJOB);
  }

}