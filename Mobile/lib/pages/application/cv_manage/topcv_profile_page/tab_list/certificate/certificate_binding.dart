import 'package:get/get.dart';

import 'certificate_controller.dart';

class CertificateBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CertificateController());
  }
}
