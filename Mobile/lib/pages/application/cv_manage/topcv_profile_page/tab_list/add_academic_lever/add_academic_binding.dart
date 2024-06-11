import 'package:get/get.dart';

import 'add_academic_controller.dart';
class AddAcademicBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AddAcademicController());
  }
}
