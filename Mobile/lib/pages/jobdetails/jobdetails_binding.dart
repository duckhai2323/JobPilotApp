import 'package:get/get.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';

class JobDetailsBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => JobDetailsController());
  }
}