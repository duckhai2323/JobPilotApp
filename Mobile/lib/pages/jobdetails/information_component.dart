import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';

class InforComponent extends GetView<JobDetailsController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Thông tin'),),
    );
  }
}