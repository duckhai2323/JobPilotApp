import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/jobfair/jobfair_controller.dart';

import '../../../common/colors/colors.dart';
import '../../../common/item_object/item_job_detail.dart';

class JobSubItem1 extends GetView<JobFairControlelr> {
  final ItemJobDetail itemJobDetail;

  JobSubItem1(this.itemJobDetail);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10,left: 15,right: 15),
      padding: EdgeInsets.only(bottom: 13,top: 13,left: 15),
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
        mainAxisAlignment: MainAxisAlignment.start,
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

          SizedBox(width: 15,),

          Container(
            margin: EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width - 155,
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

                //const SizedBox(height: 5,),

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

                //const SizedBox(height: 5,),

                Text(
                  'Hạn nộp: ${itemJobDetail.deadline_job}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.placeHolderColor
                  ),
                ),

                const SizedBox(height: 5,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.HandleEditJobPage(itemJobDetail.job_id??0);
                      },
                      child: Container(
                      width: (MediaQuery.of(context).size.width-200)/2,
                      height: 34,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor1,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.edit,size: 20,color: Colors.white,),
                          SizedBox(width: 5,),
                          Text(
                            'Chỉnh sửa',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                   ),

                    InkWell(
                      onTap: (){
                        controller.updateStatusJob(itemJobDetail.job_id??0);
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width-200)/2,
                        height: 34,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.block,size: 20,color: Colors.white,),
                            SizedBox(width: 5,),
                            Text(
                              'Đóng đơn',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    InkWell(onTap: (){
                      controller.deleteJobs(itemJobDetail.job_id??0);
                    }, child: Icon(Icons.delete,size: 25, color: Colors.red,))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}