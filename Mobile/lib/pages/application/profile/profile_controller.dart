import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';

class ProfileController extends GetxController {
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