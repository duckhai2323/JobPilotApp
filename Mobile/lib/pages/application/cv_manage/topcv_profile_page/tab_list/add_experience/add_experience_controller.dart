

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExperienceController extends GetxController {
  DateTime date = DateTime(2024, 5, 20);

  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var textController4 = TextEditingController();
  var textController5 = TextEditingController();
  var textController6 = TextEditingController();

  var isChecked = false.obs;
  void ClickBox() {
    if(isChecked.value) {isChecked.value = false;}
    else {isChecked.value = true;}
  }

  void showDialogTime (BuildContext context, String type) {
    return _showDialog(
        CupertinoDatePicker(
          initialDateTime: date,
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          onDateTimeChanged: (DateTime newDate) {
            date = newDate;
            if(type == "start") {
              textController3.text = '${date.day}/${date.month}/${date.year}';
            } else if(type == "end"){
              textController4.text = '${date.day}/${date.month}/${date.year}';
            }
          },
        ),context
    );
  }

  void _showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
