import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/add_employee/add_employee_controller.dart';

class AddEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddEmployeeController());
  }
}