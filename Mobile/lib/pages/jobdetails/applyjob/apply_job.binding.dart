import 'package:get/get.dart';
import 'package:jobpilot_app/pages/jobdetails/applyjob/apply_job_controller.dart';


class ApplyJobBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ApplyJobController());
  }
}
