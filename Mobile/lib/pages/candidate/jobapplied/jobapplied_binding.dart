import 'package:get/get.dart';

import 'jobapplied_controller.dart';
class JobAppliedBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => JobAppliedController());
  }
}