import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobDetailsController extends GetxController{
  late ScrollController scrollController;
  var isSliverAppBarExpanded = false.obs;
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
}