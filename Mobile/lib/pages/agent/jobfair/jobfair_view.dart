import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/jobfair/jobfair_controller.dart';
import 'package:jobpilot_app/pages/agent/jobfair/jobsub_item_success.dart';

import '../../../common/colors/colors.dart';
import '../../../share/jobsub_item.dart';
import '../../../share/jobsub_item_no_icon.dart';
import 'jobsub_item_agent.dart';

class JobFairPage extends GetView<JobFairControlelr>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 55,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 23,
                  color: AppColors.primaryColor1,
                  onPressed: (){

                  },
                ),
              ],
            ),
            const Text(
              'JobFair',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.primaryColor1,
                fontWeight: FontWeight.bold,
              ),
            ),

            InkWell(
              onTap: (){
                controller.HandleAddJobPage();
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primaryColor1
                ),
                child: Icon(Icons.add,color: Colors.white,size: 20,),
              ),
            ),
          ],
        ),
      ),

      body:  DefaultTabController(
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
                Tab(child: Text('Đang hiển thị'),),
                Tab(child: Text('Đang phỏng vấn'),),
                Tab(child: Text('Đã kết thúc'),),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: AppColors.backgroundColor,
                    child:Obx(()=>  ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: controller.job1s.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(onTap: (){controller.HandleJobDetailPage(controller.job1s[index].job_id??0);},child: JobSubItem1(controller.job1s[index]));
                      },
                    ),),
                  ),
                  Container(
                    color: AppColors.backgroundColor,
                    child: Obx(()=>ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: controller.job2s.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(onTap: (){controller.HandleJobDetailPage(controller.job2s[index].job_id??0);},child: JobSubItem0(controller.job2s[index]));
                      },
                    ),),
                  ),
                  Container(
                    color: AppColors.backgroundColor,
                    child: Obx(()=>ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: controller.job3s.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(onTap:(){controller.HandleJobDetailPage(controller.job3s[index].job_id??0);},child: JobSubItemSuccess(controller.job3s[index]));
                      },
                    ),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}