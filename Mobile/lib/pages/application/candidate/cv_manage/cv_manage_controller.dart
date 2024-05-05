import 'package:get/get.dart';

class CVManageController extends GetxController {
  final navigate = "cv".obs;

  void updateNavigate(String value) {
    navigate.value = value;
  }
}




