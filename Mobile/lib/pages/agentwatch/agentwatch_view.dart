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
          leading: const Icon(Icons.arrow_back_sharp),
          centerTitle: true,
          title: const Text(
            'Nhà tuyển dụng đã xem hồ sơ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: AppColors.bgTextFeild,
        body: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: '10 ',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor1,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'nhà tuyển dụng', style: TextStyle(color: AppColors.placeHolderColor,)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((_, int index) {
                    return InkWell(
                        onTap: () {},
                        child: AgentWatchItem(
                            context,
                            'assets/images/sun.png',
                            "Nguyễn Văn B",
                            "Công ty Sun Asterisk",
                            '10 tháng trước',
                        )
                    );
                  },
                  childCount: 10,
                  )
              )
            ]
        )

    );
  }
}