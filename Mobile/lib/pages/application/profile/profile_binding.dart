import 'package:get/get.dart';

class ProfileBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ProfileBinding());
  }
}