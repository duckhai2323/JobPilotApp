import 'package:get/get.dart';

import 'companies_controller.dart';

class CompaniesBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CompaniesController());
  }
}
