import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/agent/job_detail/job_detail_controller.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineInterview extends GetView<JobDetailAgentController> {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String title;
  final String date;
  TimeLineInterview(this.isFirst,this.isLast,this.isPast,this.title,this.date);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      height: 115,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isPast? AppColors.primaryColor1:AppColors.placeHolderColor,
          thickness: 3,
        ),
        indicatorStyle: IndicatorStyle(
          width: 25,
          color: isPast? AppColors.primaryColor1:AppColors.placeHolderColor,
          indicator: CircleAvatar(
            radius: 2,
            backgroundColor: Colors.white,
            child: Icon(CupertinoIcons.checkmark_alt_circle_fill,size: 25,color:isPast ? AppColors.primaryColor1:AppColors.placeHolderColor),
          ),
        ),
        endChild: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 35,
              margin: const EdgeInsets.only(right: 50,top: 30,left: 25),
              decoration: BoxDecoration(
                  color: isPast ? AppColors.primaryColor1:AppColors.placeHolderColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  )
              ),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
                ),
              ),
            ),

            Container(
              height: 50,
              margin: const EdgeInsets.only(right: 50,left: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                border: Border(
                  left: BorderSide(
                    width: 1.5,
                    color: isPast ? AppColors.primaryColor1:AppColors.placeHolderColor,
                  ),
                  right: BorderSide(
                    width: 1.5,
                    color: isPast ? AppColors.primaryColor1:AppColors.placeHolderColor,
                  ),
                  bottom: BorderSide(
                    width: 1.5,
                    color: isPast ? AppColors.primaryColor1:AppColors.placeHolderColor,
                  ),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10,),
                    Icon(Icons.calendar_month_rounded,size: 28,color: isPast ? AppColors.primaryColor1:AppColors.placeHolderColor,),
                    const SizedBox(width: 10,),
                    Text(
                      date,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color:isPast ? AppColors.primaryColor1:AppColors.placeHolderColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}