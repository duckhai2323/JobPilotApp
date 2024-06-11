import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/employee/employee_controller.dart';

class EmployeeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => EmployeeController());
  }
}