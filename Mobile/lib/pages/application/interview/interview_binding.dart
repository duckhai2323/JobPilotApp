import 'package:get/get.dart';

import 'interivew_controller.dart';
class InterviewBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => InterviewController());
  }
}