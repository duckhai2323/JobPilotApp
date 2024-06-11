import 'package:get/get.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/tab_list/skill/skill_controller.dart';

class SkillBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SkillController());
  }
}
