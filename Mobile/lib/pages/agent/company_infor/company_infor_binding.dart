import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/company_infor/company_infor_controller.dart';

class CompanyInforBingding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CompanyInforController());
  }
}