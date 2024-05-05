import 'package:get/get.dart';
import 'package:jobpilot_app/pages/application/agent/profile/profile_contronller.dart';

class AgentProfileBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AgentProfileController());
  }
}