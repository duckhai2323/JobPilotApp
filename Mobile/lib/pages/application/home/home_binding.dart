import 'package:get/get.dart';
import 'package:jobpilot_app/pages/application/home/home_controller.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {
    return Get.lazyPut(() => HomeController());
  }
}