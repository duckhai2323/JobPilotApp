import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/suitablejob/suitablejob_controller.dart';
import 'package:jobpilot_app/share/jobmain_item.dart';

import '../../common/colors/colors.dart';
import 'item_job.dart';

class SuitablePage extends GetView<SuitableController> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(	27, 74, 67,1),Color.fromRGBO(45, 93, 71,1)],
                  transform: GradientRotation(-pi/2)
              )
          ),
        ),
        leading: const Icon(Icons.arrow_back,size: 25,color: Colors.white,),
        title: const Text(
          'Gợi ý việc làm phù hợp',
            style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(
          ()=> ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemCount: controller.listJobs.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, index) {
            return   InkWell(
              onTap: (){
                controller.HandleJobdetails(controller.listJobs[index].job_id??0,controller.listJobs[index].company_id??0);
              },
              child: Obx(
                  ()=> JobSuitItem(
                    context,
                    controller.listJobs[index].company_image??"",
                    controller.listJobs[index].company_name??"",
                    controller.listJobs[index].job_title??"",
                    controller.listJobs[index].job_location??"",
                    controller.listJobs[index].experience_require??"",
                    controller.listJobs[index].salary??"",
                    controller.listJobIdSave.isNotEmpty? controller.listJobIdSave.contains(controller.listJobs[index].job_id.toString()):false,
                    index
                ),
              ),
            );
          },
        ),
      ),
     );
  }
}
