import 'package:get/get.dart';

import 'company_infor_controller.dart';

class CompanyInforBingding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CompanyInforController());
  }
}