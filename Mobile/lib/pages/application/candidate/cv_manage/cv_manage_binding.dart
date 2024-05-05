import 'package:get/get.dart';

import 'cv_manage_controller.dart';


class CVManageBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CVManageController());
  }
}