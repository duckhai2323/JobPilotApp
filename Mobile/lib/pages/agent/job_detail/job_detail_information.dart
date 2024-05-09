import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:jobpilot_app/pages/agent/job_detail/job_detail_controller.dart';

import '../../../common/colors/colors.dart';
import '../../../share/icon_job_details.dart';
import '../../../share/job_detail_content.dart';

class JobDetailInfor extends GetView<JobDetailAgentController> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            ()=>Padding(
              padding: const EdgeInsets.only(left: 15,top: 15),
              child: Text(
               controller.jobDetails.isNotEmpty?controller.jobDetails[0].job_title:"",
                style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Obx(()=>IconJobDetails(const Icon(Icons.hourglass_bottom,size: 25,color: AppColors.primaryColor1,), 'Kinh nghiệm', controller.jobDetails.isNotEmpty? controller.jobDetails[0].experience_require:"")),
          Obx(()=> IconJobDetails(const Icon(Icons.location_on,size: 25,color: AppColors.primaryColor1,), 'Địa điểm', controller.jobDetails.isNotEmpty?controller.jobDetails[0].job_location:"")),
          Obx(()=> IconJobDetails(const Icon(Icons.monetization_on_outlined,size: 25,color: AppColors.primaryColor1,),  'Mức lương', controller.jobDetails.isNotEmpty?controller.jobDetails[0].salary:"")),
          Obx(()=>IconJobDetails(const Icon(Icons.calendar_month,size: 25,color: AppColors.primaryColor1,), 'Hình thức',controller.jobDetails.isNotEmpty? controller.jobDetails[0].work_form:"")),
          Obx(()=> IconJobDetails(const Icon(Icons.group,size: 25,color: AppColors.primaryColor1,), 'Số lượng tuyển',controller.jobDetails.isNotEmpty? controller.jobDetails[0].candidate_number.toString()+' người':"")),
          Obx(()=> IconJobDetails(const Icon(Icons.av_timer,size: 25,color: AppColors.primaryColor1,),  'Hạn nộp hồ sơ',controller.jobDetails.isNotEmpty? controller.jobDetails[0].deadline_job:"")),
          const SizedBox(height: 5,),

          Obx(()=> JobDetailContent('Mô tả công việc', controller.jobDetails.isNotEmpty? controller.jobDetails[0].job_details:"", context)),
          Obx(()=>JobDetailContent('Yêu cầu ứng viên', controller.jobDetails.isNotEmpty? controller.jobDetails[0].job_require:"", context)),
          Obx(()=> JobDetailContent('Quyền lợi', controller.jobDetails.isNotEmpty?  controller.jobDetails[0].job_benefit:"", context)),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}