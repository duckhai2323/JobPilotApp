import 'package:get/get.dart';
import 'package:jobpilot_app/pages/add_experience/add_experience_controller.dart';

class AddExperienceBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AddExperienceController());
  }
}
