import 'package:get/get.dart';
import 'package:jobpilot_app/pages/certificate/certificate_controller.dart';

class CertificateBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CertificateController());
  }
}
