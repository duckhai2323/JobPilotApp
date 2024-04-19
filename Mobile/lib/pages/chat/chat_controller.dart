import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{
  var messageText = TextEditingController();
  final visible = RxBool(true);
}