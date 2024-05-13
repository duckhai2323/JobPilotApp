import 'package:get/instance_manager.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/topcv_profile_controller.dart';

class TopCVProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopCVProfileController());
  }
}
