import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {
    return Get.lazyPut(() => HomeController());
  }
}