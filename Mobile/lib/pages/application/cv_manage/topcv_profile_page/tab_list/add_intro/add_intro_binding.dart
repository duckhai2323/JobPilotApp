import 'package:get/get.dart';

import 'add_intro_controller.dart';
class AddIntroBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AddIntroController());
  }
}