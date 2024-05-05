import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agentwatch/agentwatch_controller.dart';

class AgentWatchBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AgentWatchController());
  }
}