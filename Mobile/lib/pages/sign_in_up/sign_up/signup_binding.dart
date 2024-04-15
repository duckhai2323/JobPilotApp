import 'package:get/get.dart';
import 'package:jobpilot_app/pages/sign_in_up/sign_up/signup_controller.dart';

import 'candidate_provider.dart';

class SignUpBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}