import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/job_detail/candidate_infor.dart';
import 'package:jobpilot_app/pages/agent/job_detail/interview_infor.dart';
import 'package:jobpilot_app/pages/agent/job_detail/job_detail_controller.dart';
import 'package:jobpilot_app/pages/agent/job_detail/job_detail_information.dart';

import '../../../common/colors/colors.dart';

class JobDetailAgentPage extends GetView<JobDetailAgentController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Chi tiết',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.primaryColor1,
                fontWeight: FontWeight.bold,
              ),
            ),

            InkWell(
              onTap: (){
                if(controller.stateTab.value == 2) {
                  controller.updateStatusJob(context);
                }
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primaryColor1
                ),
                child: Obx(()=>Icon(controller.stateTab.value == 0 || controller.stateTab.value == 1 ? Icons.settings:CupertinoIcons.checkmark_seal_fill,color: Colors.white,size: 20,)),
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
            TabBar(
              onTap: (index) {
                controller.onPageChange(index);
              },
              controller: controller.tabController,
              isScrollable: true,
              labelColor: AppColors.primaryColor1,
              dividerColor: AppColors.bgTextFeild,
              unselectedLabelColor: AppColors.placeHolderColor,
              tabAlignment: TabAlignment.start,
              indicatorColor: AppColors.primaryColor1,
              labelStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600
              ),
              dividerHeight: 2,
              tabs: [
                const Tab(child: Text('Thông tin chung'),),
                const Tab(child: Text('Thông tin phỏng vấn'),),
                Tab(child: Obx(()=> Text(controller.tabTitle.value)),),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  JobDetailInfor(),
                  InterviewInfor(),
                  CandidateList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}