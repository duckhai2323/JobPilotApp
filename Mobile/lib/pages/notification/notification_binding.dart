import 'package:get/get.dart';
import 'package:jobpilot_app/pages/notification/notification_controller.dart';

class NotificationBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
