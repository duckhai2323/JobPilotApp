import 'package:get/get.dart';
import 'package:jobpilot_app/pages/companies/companies_controller.dart';

class CompaniesBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CompaniesController());
  }
}
