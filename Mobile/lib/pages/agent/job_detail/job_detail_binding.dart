import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/job_detail/job_detail_controller.dart';

class JobDetailAgentBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => JobDetailAgentController());
  }
}