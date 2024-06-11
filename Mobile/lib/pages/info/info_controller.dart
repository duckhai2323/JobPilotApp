import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoController extends GetxController{
  DateTime date = DateTime(2024, 5, 20);

  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var textController4 = TextEditingController();

  var value_ = 0.obs;

  void ActionRadio(int index) {
    value_.value = index;
  }

  void showDialogTime (BuildContext context, String type) {
    return _showDialog(
        CupertinoDatePicker(
          initialDateTime: date,
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          onDateTimeChanged: (DateTime newDate) {
            date = newDate;
            if (type == "birth") {
              textController1.text = '${date.day}/${date.month}/${date.year}';
            }
          },
        ), context
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