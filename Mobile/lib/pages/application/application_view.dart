import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/agent/company_infor/company_infor_view.dart';
import 'package:jobpilot_app/pages/agent/home/home_view.dart';
import 'package:jobpilot_app/pages/agent/jobfair/jobfair_view.dart';
import 'package:jobpilot_app/pages/agent/profile/profile_view.dart';
import 'package:jobpilot_app/pages/application/message/message_view.dart';
import 'package:jobpilot_app/pages/application/profile/profile_view.dart';
import 'package:jobpilot_app/pages/application/cv_manage/cv_manage_view.dart';
import 'package:jobpilot_app/pages/chat/chat_view.dart';


import '../../common/colors/colors.dart';
import 'application_controller.dart';
import 'home/home_view.dart';

class ApplicationPage extends GetView<ApplicationController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (index){
          controller.handPageChanged(index);
        },
        children: [
          controller.position.value == 'candidate'?HomePage():AgentHomePage(),
          controller.position.value == 'candidate'? CVManage():CompanyInforPage(),
          controller.position.value == 'candidate'? MessagePage():JobFairPage(),
          controller.position.value == 'candidate'? Center(child: Text('INTERVIEW'),):MessagePage(),
          controller.position.value == 'candidate'? ProfilePage():AgentProfilePage(),
        ],
      ),

      bottomNavigationBar: Obx(() => BottomNavigationBar(
        items: controller.position.value == "candidate"?controller.bottomTab:controller.bottomTabAgent,
        currentIndex: controller.state.value,
        type: BottomNavigationBarType.fixed,
        onTap: controller.handNavBarTap,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: AppColors.primaryColor1,
        unselectedItemColor: Colors.grey,
      )),
    );
  }
}