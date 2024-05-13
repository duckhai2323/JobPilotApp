import 'package:get/get.dart';

class InfoController extends GetxController{
  String _gender = ''; // Biến để lưu trữ giới tính

  String get gender => _gender;

  void updateGender(String newGender) {
    _gender = newGender; // Cập nhật giới tính mới
   
  }
}