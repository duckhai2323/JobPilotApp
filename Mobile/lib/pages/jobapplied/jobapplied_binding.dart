import 'package:get/get.dart';
import 'package:jobpilot_app/pages/jobapplied/jobapplied_controller.dart';

class JobAppliedBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => JobAppliedController());
  }
}