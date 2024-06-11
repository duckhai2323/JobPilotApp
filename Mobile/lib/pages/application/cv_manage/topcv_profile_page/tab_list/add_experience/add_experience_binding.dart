import 'package:get/get.dart';

import 'add_experience_controller.dart';

class AddExperienceBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AddExperienceController());
  }
}
