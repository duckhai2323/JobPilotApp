import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';

class TopCVProfileController extends GetxController {
  void HandleAddExperiencePage() {
    Get.toNamed(AppRoutes.ADDEXPERIENCE);
  }
  void HandleAddAcademicLeverPage() {
    Get.toNamed(AppRoutes.ADDACADEMICLEVER);
  }
}
