import 'package:get/get.dart';
import 'package:jobpilot_app/pages/sign_in_up/sign_up/signup_controller.dart';

class SignUpBinding extends Bindings {

  @override
  void dependencies() {
    return Get.lazyPut(() => SignUpController());
  }
}