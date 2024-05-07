import 'package:get/get.dart';
import 'package:jobpilot_app/pages/attractivejob/attractivejob_controller.dart';

class AttractiveJobBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AttractiveJobController());
  }
}
