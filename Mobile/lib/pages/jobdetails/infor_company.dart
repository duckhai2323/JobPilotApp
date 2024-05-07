import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/share/jobmain_item.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';

import '../../share/job_detail_content.dart';

class InforCompany extends GetView<JobDetailsController> {
  const InforCompany({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget> [
          SliverToBoxAdapter(
            child: Obx(()=>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    controller.companies.isNotEmpty?controller.companies[0].company_name:"",
                    style: const TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bgIcon,
                        child: Icon(Icons.location_city,size: 25,color: AppColors.primaryColor1,),
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Địa chỉ công ty',
                            style: TextStyle (
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          Text(
                           controller.companies.isNotEmpty?controller.companies[0].company_location:'',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bgIcon,
                        child: Icon(Icons.stars,size: 25,color: AppColors.primaryColor1,),
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Website công ty',
                            style: TextStyle (
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          Text(
                            controller.companies.isNotEmpty?controller.companies[0].company_link:'',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                JobDetailContent('Giới thiệu công ty',   controller.companies.isNotEmpty?controller.companies[0].company_intro:'', context),
                const Padding(
                  padding: EdgeInsets.only(left: 15,top: 15,bottom: 15),
                  child: Text(
                    "Việc làm cùng công ty",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),),
          ),
          Obx(() => SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return InkWell(onTap: () {controller.HandleJobdetails(controller.jobs[index].job_id??0, controller.jobs[index].company_id??0);},child: JobMainItem(
                    context,
                    controller.jobs[index].company_image,
                    controller.jobs[index].company_name,
                    controller.jobs[index].job_title,
                    controller.jobs[index].job_location,
                    controller.jobs[index].experience_require,
                    controller.jobs[index].salary,
                    false
                ));
              },
              childCount: controller.jobs.length,
            ),
          ),),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100,),
          ),
        ],
      ),
    );
  }
}