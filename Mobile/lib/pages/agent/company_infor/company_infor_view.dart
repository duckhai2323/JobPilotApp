import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/agent/company_infor/company_infor_controller.dart';
import 'package:jobpilot_app/pages/agent/company_infor/jobsub_item_agent.dart';
import 'package:jobpilot_app/share/jobsub_item.dart';
import 'package:jobpilot_app/pages/agent/jobfair/jobsub_item_agent.dart';

import '../../../share/job_detail_content.dart';

class CompanyInforPage extends GetView<CompanyInforController> {

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.companies.isEmpty
        ? const Center(child: CircularProgressIndicator(),)
        :Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color.fromRGBO(	27, 74, 67,1),Color.fromRGBO(2, 171, 79,1)],
                      transform: GradientRotation(-pi/2)
                  )
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/company_infor_image.jpg'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ),

                  Positioned(
                    top: 35,
                    right: 20,
                    child: InkWell(
                      onTap: (){
                        controller.HandleEditPage();
                      },
                      child: Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.settings,size: 25,color: AppColors.primaryColor1,),
                            SizedBox(width: 5,),
                            Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:AppColors.primaryColor1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 80,
                    left: 20,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundColor: Colors.white,
                      backgroundImage: CachedNetworkImageProvider(controller.companies[0].company_image),
                    ),
                  ),

                  Positioned(
                    left: 125,
                    bottom: 15,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*2/3,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.companies[0].company_name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),

                          const SizedBox(height: 5,),

                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(CupertinoIcons.globe,size: 20,color: Colors.white,),
                                  const SizedBox(width: 10,),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      controller.companies[0].company_link,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.business,size: 20,color: Colors.white,),
                                  const SizedBox(width: 10,),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      controller.companies[0].employee_scale,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thông tin công ty',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(height: 15,),
                  Row(
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width-90,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              controller.companies[0].company_location,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bgIcon,
                        child: Icon(Icons.calendar_month,size: 24,color: AppColors.primaryColor1,),
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Năm thành lập',
                            style: TextStyle (
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width-90,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              controller.companies[0].company_organize,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bgIcon,
                        child: Icon(Icons.auto_graph,size: 24,color: AppColors.primaryColor1,),
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Lĩnh vực phát triển',
                            style: TextStyle (
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width-90,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              controller.companies[0].company_filed,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bgIcon,
                        child: Icon(Icons.people,size: 24,color: AppColors.primaryColor1,),
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Người theo dõi',
                            style: TextStyle (
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width-90,
                            child: const Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              '300',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(bottom: 15),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: JobDetailContent('Giới thiệu công ty', controller.companies[0].company_intro, context),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Text(
                'Việc làm đang hiển thị',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

            Obx(() => ListView.builder(
              padding: const EdgeInsets.only(top: 15),
              itemCount: controller.jobs.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return JobSubItemInfor(
                  controller.jobs[index].company_image??"",
                  controller.jobs[index].company_name??"",
                  controller.jobs[index].job_title??"",
                  controller.jobs[index].job_location??"",
                  controller.jobs[index].deadline_job??"",
                  controller.jobs[index].salary??""
                );
              },
            ),),


          ],
        ),
      ),
    ));
  }
}