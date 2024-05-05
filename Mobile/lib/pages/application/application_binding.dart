import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jobpilot_app/pages/agent/company_infor/company_infor_controller.dart';
import 'package:jobpilot_app/pages/agent/home/home_contoller.dart';
import 'package:jobpilot_app/pages/agent/jobfair/jobfair_controller.dart';
import 'package:jobpilot_app/pages/agent/profile/profile_contronller.dart';
import 'package:jobpilot_app/pages/application/message/message_controller.dart';
import 'package:jobpilot_app/pages/application/message/message_view.dart';
import 'package:jobpilot_app/pages/application/profile/profile_controller.dart';

import 'application_controller.dart';
import 'home/home_controller.dart';

class ApplicationBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => ProfileController());
    
    Get.lazyPut(() => CompanyInforController());
    Get.lazyPut(() => AgentHomeController());
    Get.lazyPut(() => AgentProfileController());
    Get.lazyPut(() => JobFairControlelr());
  }
}