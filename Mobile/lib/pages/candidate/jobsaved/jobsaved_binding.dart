import 'package:get/get.dart';

import 'jobsaved_controller.dart';
class JobSavedBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => JobSavedController());
  }
}