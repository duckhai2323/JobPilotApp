import 'package:get/get.dart';
import 'package:jobpilot_app/pages/jobsaved/jobsaved_controller.dart';

class JobSavedBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => JobSavedController());
  }
}