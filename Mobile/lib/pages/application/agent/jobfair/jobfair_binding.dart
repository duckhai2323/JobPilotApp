import 'package:get/get.dart';

import 'jobfair_controller.dart';

class JobFairBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => JobFairControlelr());
  }
}