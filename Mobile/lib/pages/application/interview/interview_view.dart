import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/colors/colors.dart';
import 'interivew_controller.dart';
class InterviewPage extends GetView<InterviewController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        automaticallyImplyLeading:false,
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Job Fair',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.primaryColor1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const TabBar(
              isScrollable: true,
              labelColor: AppColors.primaryColor1,
              dividerColor: AppColors.bgTextFeild,
              unselectedLabelColor: AppColors.placeHolderColor,
              tabAlignment: TabAlignment.center,
              indicatorColor: AppColors.primaryColor1,
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600
              ),
              tabs: [
                Tab(child: Text('Đang ứng tuyển'),),
                Tab(child: Text('Ứng tuyển thành công'),),
                Tab(child: Text('Ứng tuyển thất bại'),),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}