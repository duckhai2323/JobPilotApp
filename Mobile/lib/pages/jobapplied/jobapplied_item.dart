import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/jobapplied/jobapplied_controller.dart';

import '../../../common/colors/colors.dart';

class JobAppliedItem extends GetView<JobAppliedController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10,left: 15,right: 15),
      padding: EdgeInsets.only(bottom: 10,top: 15,left: 15,right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
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
                ]
                ),
                child: Image.asset(
                  'assets/images/sun.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width - 175,
                height: 70,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     const Text(
                       'Fresher Developer FrontEnd',
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor2
                       ),
                     ),


                     const Text(
                        'CÔNG TY CỔ PHẦN SUN ASTERISK',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           color: AppColors.primaryColor2
                        ),
                      ),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on_outlined ,size: 15,color: AppColors.primaryColor1,),
              SizedBox(width: 10,),
              Text(
                'Hà Nội, Cầu Giấy',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.currency_exchange_rounded ,size: 15,color: AppColors.primaryColor1,),
              SizedBox(width: 10,),
              Text(
                'Trên 4 triệu',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 100,),
              Icon(Icons.av_timer_rounded ,size: 15,color: AppColors.primaryColor1,),
              SizedBox(width: 10,),
              Text(
                '19/07/2023',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size(150, 40),
                  elevation: 2,
                  backgroundColor: Color.fromRGBO(102, 255, 178, 0.8),
                  foregroundColor: AppColors.primaryColor1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () => {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.ellipses_bubble,
                      size: 20,
                    ),
                    SizedBox(width: 4,),
                    Text(
                        "Gửi tin nhắn"
                    )
                  ],
                )
              ),
              SizedBox(width: 15),
              TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: Size(150, 40),
                    elevation: 2,
                    backgroundColor: AppColors.bgTextFeild,
                    foregroundColor: AppColors.primaryColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Xem lại CV"
                      )
                    ],
                  )
              ),
            ],
          )
        ],
      )
    );
  }
}