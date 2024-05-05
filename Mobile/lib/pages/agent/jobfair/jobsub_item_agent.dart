import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/jobfair/jobfair_controller.dart';

import '../../../common/colors/colors.dart';

class JobSubItem1 extends GetView<JobFairControlelr> {
  final String companyImage;
  final String companyName;
  final String jobTitle;
  final String jobLocation;
  final String deadline_job;
  final String salary;

  JobSubItem1(
      this.companyImage,
      this.companyName,
      this.jobTitle,
      this.jobLocation,
      this.deadline_job,
      this.salary
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10,left: 15,right: 15),
      padding: EdgeInsets.only(bottom: 15,top: 15,left: 15,right: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          // border: Border.all(
          //   color: AppColors.primaryColor1,
          //   width: 1,
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.25,
              blurRadius: 2,
              offset: Offset(0,2),
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.25,
                    blurRadius: 2,
                    offset: Offset(0,2),
                  )
                ],
                image: DecorationImage(
                  image: NetworkImage(companyImage),
                  fit: BoxFit.cover,
                )
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width - 175,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor2
                  ),
                ),

                //SizedBox(height: 5,),

                Text(
                  companyName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor2
                  ),
                ),

                const SizedBox(height: 5,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10,),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 5),
                      decoration: BoxDecoration(
                        color: AppColors.bgSearch,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          salary,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor2
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10,),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 5),
                      decoration: BoxDecoration(
                        color: AppColors.bgSearch,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          'Hạn nộp: $deadline_job',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor2
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Container(
              height: 140,
              padding: EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.mode_edit_outlined,size: 25,color: AppColors.primaryColor1,),
                  SizedBox(height: 10,),
                  Icon(Icons.delete_outline, color: Colors.red,size: 25,),
                ],
              ))
        ],
      ),
    );
  }
}