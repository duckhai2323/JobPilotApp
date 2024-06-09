import 'package:get/get.dart';
import 'package:jobpilot_app/pages/add_academic_lever/add_academic_controller.dart';

class AddAcademicBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AddAcademicController());
  }
}
