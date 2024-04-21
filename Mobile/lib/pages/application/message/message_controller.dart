import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';

class MessageController extends GetxController {
  void HandleChatPage () {
    Get.toNamed(AppRoutes.CHAT);
  }
}
