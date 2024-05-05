import 'package:get/get.dart';
import 'package:jobpilot_app/pages/candidate/suitablejob/suitablejob_controller.dart';

class SuitableBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SuitableController());
  }
}
