import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';

class HomeController extends GetxController {
  void HandleNotifiPage () {
    Get.toNamed(AppRoutes.NOTIFICATION);
  }

  void HandleJobdetails () {
    Get.toNamed(AppRoutes.JOBDETAILS);
  }
}