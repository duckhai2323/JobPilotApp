import 'package:get/get.dart';
import 'package:jobpilot_app/pages/skill/skill_controller.dart';

class SkillBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SkillController());
  }
}
