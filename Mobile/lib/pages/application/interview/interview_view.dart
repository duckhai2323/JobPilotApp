import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/application/interview/item_job.dart';

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
                  Container(
                    color: AppColors.backgroundColor,
                    child: Obx(()=>ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: controller.homController.job1s.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            controller.homController.HandleJobdetails(controller.homController.job1s[index].job_id??0,controller.homController.job1s[index].company_id??0);
                          },
                          child: JobInterviewItem(
                              controller.homController.job1s[index].job_fair_id??0,
                              controller.homController.job1s[index].company_image??"",
                              controller.homController.job1s[index].company_name??"",
                              controller.homController.job1s[index].job_title??"",
                              controller.homController.job1s[index].job_location??"",
                              controller.homController.job1s[index].deadline_job??"",
                              controller.homController.job1s[index].salary??"",
                              1,
                              controller.homController.job1s[index].status??0,
                          ),
                        );
                      },
                    ),),
                  ),

                  Container(
                    color: AppColors.backgroundColor,
                    child: Obx(()=>ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: controller.homController.job2s.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return JobInterviewItem(
                            controller.homController.job2s[index].job_fair_id??0,
                            controller.homController.job2s[index].company_image??"",
                            controller.homController.job2s[index].company_name??"",
                            controller.homController.job2s[index].job_title??"",
                            controller.homController.job2s[index].job_location??"",
                            controller.homController.job2s[index].deadline_job??"",
                            controller.homController.job2s[index].salary??"",
                            2,
                            controller.homController.job2s[index].status??0,
                        );
                      },
                    ),),
                  ),

                  Container(
                    color: AppColors.backgroundColor,
                    child: Obx(()=>ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: controller.homController.job3s.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            controller.homController.HandleJobdetails(controller.homController.job3s[index].job_id??0,controller.homController.job3s[index].company_id??0);
                          },
                          child: JobInterviewItem(
                              controller.homController.job3s[index].job_fair_id??0,
                              controller.homController.job3s[index].company_image??"",
                              controller.homController.job3s[index].company_name??"",
                              controller.homController.job3s[index].job_title??"",
                              controller.homController.job3s[index].job_location??"",
                              controller.homController.job3s[index].deadline_job??"",
                              controller.homController.job3s[index].salary??"",
                              3,
                              controller.homController.job3s[index].status??0,
                          ),
                        );
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