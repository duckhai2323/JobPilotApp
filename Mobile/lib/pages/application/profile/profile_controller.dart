import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';

import '../home/home_controller.dart';

class ProfileController extends GetxController {
  var homController = Get.find<HomeController>();
  void HandleJobAppliedPage() {
    Get.toNamed(AppRoutes.JOBAPPLIED);
  }

  void HandleJobSavedPage() {
    Get.toNamed(AppRoutes.JOBSAVED);
  }

  void HandleAgentWatchPage() {
    Get.toNamed(AppRoutes.AGENTWATCH);
  }
}