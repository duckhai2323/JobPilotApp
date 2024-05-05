import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/home/home_contoller.dart';

class AgentHomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AgentHomeController());
  }
}