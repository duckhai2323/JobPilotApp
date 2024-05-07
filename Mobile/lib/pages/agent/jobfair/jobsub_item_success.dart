import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/item_object/item_job_detail.dart';
import 'package:jobpilot_app/pages/agent/jobfair/jobfair_controller.dart';

import '../../../common/colors/colors.dart';

class JobSubItemSuccess extends GetView<JobFairControlelr> {
  final ItemJobDetail itemJobDetail;
  JobSubItemSuccess(this.itemJobDetail);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10,left: 15,right: 15),
      padding: EdgeInsets.only(bottom: 15,top: 15,left: 15,right: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
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
                  image: NetworkImage(itemJobDetail.company_image??""),
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
                  itemJobDetail.job_title??"",
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
                  itemJobDetail.company_name??"",
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
                      child: const Center(
                        child: Text(
                          'Đã hoàn thành',
                          style: TextStyle(
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
                          'Tuyển: ${itemJobDetail.candidate_number} NV',
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
          InkWell(
            onTap: (){
              controller.deleteJobs(itemJobDetail.job_id??0);
            },
            child: Container(
                height: 140,
                padding: const EdgeInsets.only(left: 5),
                child: const Center(
                  child: Icon(Icons.delete, color: Colors.red,size: 25,),
                )
            ),
          )
        ],
      ),
    );
  }
}