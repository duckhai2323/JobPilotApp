import 'package:get/get.dart';
import 'package:jobpilot_app/pages/application/cv_manage/cv_manage_controller.dart';

class CVManageBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CVManageController());
  }
}