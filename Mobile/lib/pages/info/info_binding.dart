import 'package:get/get.dart';
import 'package:jobpilot_app/pages/info/info_controller.dart';

class InfoBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => InfoController());
  }
}
