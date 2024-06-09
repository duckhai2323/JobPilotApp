import 'package:get/get.dart';

class CertificateController extends GetxController{
   // Biến boolean để lưu trữ trạng thái của ô vuông
  var noExpirationDate = false.obs;

  // Phương thức để cập nhật trạng thái của ô vuông
  void updateNoExpirationDate(bool value) {
    noExpirationDate.value = value;
  }
}