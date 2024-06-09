import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/common/item_object/item_candidate_jobfair.dart';
import 'package:jobpilot_app/pages/agent/job_detail/job_detail_controller.dart';

class ItemCandidate extends GetView<JobDetailAgentController> {
  final ItemCandidateApply itemCandidateApply;
  final ItemColor itemColor;

  ItemCandidate(this.itemCandidateApply,this.itemColor);
  @override
  Widget build(BuildContext context) {
    var status_offer = itemCandidateApply.status_offer;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 155,
      margin: const EdgeInsets.only(bottom: 12,left: 15,right: 15),
      padding: const EdgeInsets.only(bottom: 15,top: 15,left: 15,right: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(itemCandidateApply.candidate_image),
          ),
          Container(
            width: MediaQuery.of(context).size.width-135,
            height: 140,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemCandidateApply.candidate_name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  itemCandidateApply.candidate_email,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),
                ),

                SizedBox(height: 5,),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 5),
                  decoration: BoxDecoration(
                    color: AppColors.bgSearch,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    '1 nam kinh nghiem',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                controller.jobDetails[0].status!=0?Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        controller.ClickButtonSubmit(itemColor.job_fair_id, "pass");
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width-200)/2,
                        height: 34,
                        decoration: BoxDecoration(
                            color: itemColor.passColor,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.checkmark_seal_fill,size: 20,color: Colors.white,),
                            SizedBox(width: 5,),
                            Text(
                              'Đỗ',
                              style: TextStyle(
                                fontSize: 15,
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
                        controller.ClickButtonSubmit(itemColor.job_fair_id, "fail");
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width-200)/2,
                        height: 34,
                        decoration: BoxDecoration(
                            color:itemColor.failColor,
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
                              'Trượt',
                              style: TextStyle(
                                fontSize: 15,
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
                        controller.ClickItemChat(itemCandidateApply);
                      },
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: const Center(
                          child: Icon(Icons.chat,color: Colors.white,size: 22,),
                        ),
                      ),
                    ),
                  ],
                ): Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 34,
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                      decoration: BoxDecoration(
                          color:status_offer==1?AppColors.primaryColor1:Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(status_offer == 0 ?Icons.flag_circle:(status_offer == 1?Icons.check_circle_rounded:Icons.block),size: 20,color: Colors.white,),
                          SizedBox(width: 5,),
                          Text(
                            status_offer == 0 ?'Đang chờ xác nhận':(status_offer == 1?'Đã nhận Offer':'Đã từ chối Offer'),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10,),

                    InkWell(
                      onTap: (){
                        controller.ClickItemChat(itemCandidateApply);
                      },
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: const Center(
                          child: Icon(Icons.chat,color: Colors.white,size: 22,),
                        ),
                      ),
                    ),
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