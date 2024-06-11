

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillController extends GetxController{
  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var rating = 0.0.obs;

  void handleAddSkill() {
    print(rating.value);
  }
}