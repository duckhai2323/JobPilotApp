import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jobpilot_app/pages/application/message/message_controller.dart';

import 'agent/company_infor/company_infor_controller.dart';
import 'agent/home/home_contoller.dart';
import 'agent/jobfair/jobfair_controller.dart';
import 'agent/profile/profile_contronller.dart';
import 'application_controller.dart';
import 'candidate/home/home_controller.dart';
import 'candidate/profile/profile_controller.dart';

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