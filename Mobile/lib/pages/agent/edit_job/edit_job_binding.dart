import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/edit_job/edit_job_controller.dart';

class EditJobBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => EditJobController());
  }
}