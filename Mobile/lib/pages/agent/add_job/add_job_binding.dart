import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/add_job/add_job_controller.dart';

class AddJobBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AddJobController());
  }
}