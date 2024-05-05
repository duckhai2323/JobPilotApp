import 'package:get/get.dart';

import 'apply_job_controller.dart';

class ApplyJobBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ApplyJobController());
  }
}
