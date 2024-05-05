import 'package:get/get.dart';

import 'home_contoller.dart';

class AgentHomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AgentHomeController());
  }
}