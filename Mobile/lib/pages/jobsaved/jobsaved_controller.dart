import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';

class JobSavedController extends GetxController{
  void HandleJobDetails () {
    Get.toNamed(AppRoutes.JOBDETAILS);
  }
}