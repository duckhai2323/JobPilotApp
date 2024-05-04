import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/item_add_edit/item_add_interview.dart';
import 'package:jobpilot_app/common/item_add_edit/item_add_job_object.dart';

class AddJobController extends GetxController {
  DateTime date = DateTime(2024, 5, 20);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  var textController3 = TextEditingController();
  var textController4 = TextEditingController();
  var textController5 = TextEditingController();
  var textController6 = TextEditingController();
  var textController7 = TextEditingController();
  var textController8 = TextEditingController();
  var textController9 = TextEditingController();
  var textController10 = TextEditingController();

  List<ItemAddInterview> listInterview = <ItemAddInterview>[ItemAddInterview(TextEditingController(), 'Chọn ngày/tháng/năm')].obs;

  void showDialog (BuildContext context, int index) {
    return _showDialog(
      CupertinoDatePicker(
        initialDateTime: date,
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        onDateTimeChanged: (DateTime newDate) {
          date = newDate;
          ItemAddInterview temp = listInterview[index];
          listInterview.removeAt(index);
          listInterview.insert(index, ItemAddInterview(temp.textEditingController,'${date.day}/${date.month}/${date.year}'));
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

  void addInterView() {
    listInterview.add(ItemAddInterview(TextEditingController(), 'Chọn ngày/tháng/năm'));
  }

  void cancelInterview(int index) {
    listInterview.removeAt(index);
  }
}