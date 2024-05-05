import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/jobfair/jobfair_controller.dart';

class JobFairBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => JobFairControlelr());
  }
}