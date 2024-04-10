import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../common/colors/colors.dart';
import 'application_controller.dart';
import 'home/home_view.dart';

class ApplicationPage extends GetView<ApplicationController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (index){
          controller.handPageChanged(index);
        },
        children: [
          HomePage(),
          Center(child: Text('CV'),),
          Center(child: Text('CHAT'),),
          Center(child: Text('INTERVIEW'),),
          Center(child: Text('PROFILE'),),
        ],
      ),

      bottomNavigationBar: Obx(() => BottomNavigationBar(
        items:controller.bottomTab,
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