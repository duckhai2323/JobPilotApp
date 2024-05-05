import 'package:get/get.dart';

import 'jobdetails_controller.dart';

class JobDetailsBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => JobDetailsController());
  }
}