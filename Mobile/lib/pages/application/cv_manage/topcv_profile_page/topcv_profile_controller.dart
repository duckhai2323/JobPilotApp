import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';

class TopCVProfileController extends GetxController {
   void HandleSkillPage () {
    Get.toNamed(AppRoutes.SKILL);
  }

   void HandleCertificatePage () {
    Get.toNamed(AppRoutes.CERTIFICATE);
  }

  void HandleInfoPage () {
    Get.toNamed(AppRoutes.INFO);
  }
}
