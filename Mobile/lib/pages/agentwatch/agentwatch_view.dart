import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/agentwatch/agentwatch_controller.dart';
import 'package:jobpilot_app/pages/agentwatch/agentwatch_item.dart';


class AgentWatchPage extends GetView<AgentWatchController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(Icons.arrow_back_sharp,size: 25,color: AppColors.primaryColor1,),
          centerTitle: true,
          title: const Text(
            'Nhà tuyển dụng đã xem hồ sơ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor1
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15),
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return AgentWatchItem(
              context,
              'https://assets-global.website-files.com/5fb85f26f126ce08d792d2d9/65fddafcf36551945213fe85_After_kime.jpg',
              "Nguyễn Văn B",
              "Công ty Sun Asterisk",
              '10 tháng trước',
            );
          },
        ),
    );
  }
}