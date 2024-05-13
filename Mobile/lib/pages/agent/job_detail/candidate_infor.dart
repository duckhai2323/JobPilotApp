import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/agent/job_detail/item_candidate.dart';
import 'package:jobpilot_app/pages/agent/job_detail/job_detail_controller.dart';

import '../../../common/colors/colors.dart';

class CandidateList extends GetView<JobDetailAgentController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Obx(
          ()=> ListView.builder(
          padding: EdgeInsets.only(top: 15,bottom:15 ),
          itemCount: controller.listButton.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemCandidate(
                controller.candidates[index].candidate_name,
                controller.candidates[index].candidate_email,
                controller.candidates[index].candidate_image,
                controller.candidates[index].status_offer??0,
                controller.listButton[index]
            );
          },
        ),
      ),
    );
  }
}