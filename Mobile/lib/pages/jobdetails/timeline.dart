
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/agent/job_detail/timeline_tracker.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';
class InterviewInfor extends GetView<JobDetailsController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
            ()=> ListView.builder(
          padding: EdgeInsets.only(bottom: 30),
          itemCount: controller.interviews.length,
          itemBuilder: (BuildContext context, int index) {
            return TimeLineInterview(
                index==0?true:false,
                index == controller.interviews.length-1?true:false,
                controller.interviews[index].status==1?true:false,
                controller.interviews[index].interview_type,
                controller.interviews[index].interview_date,
                controller.interviews[index].index
            );
          },
        ),
      ),
    );
  }
}