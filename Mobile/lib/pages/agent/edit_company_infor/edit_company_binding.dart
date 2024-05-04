import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/edit_company_infor/edit_company_controller.dart';

class EditCompanyBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => EditCompanyController());
  }
}