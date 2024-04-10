import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../common/routes/names.dart';

class SignInController extends GetxController {
  void HandlePageSignup(){
    Get.toNamed(AppRoutes.SIGNUP);
  }

  void HandleHomePage() {
    Get.toNamed(AppRoutes.APPLICATION);
  }
}