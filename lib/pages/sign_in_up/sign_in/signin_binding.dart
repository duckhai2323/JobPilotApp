import 'package:get/get.dart';
import 'package:jobpilot_app/pages/sign_in_up/sign_in/signin_controller.dart';

class SignInBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}