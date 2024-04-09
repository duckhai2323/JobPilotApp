import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/application/home/home_controller.dart';

import '../../../common/colors/colors.dart';

class CompanyItem extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        // border: Border.all(
        //   color: AppColors.primaryColor1, // Màu của viền
        //   width: 1, // Độ dày của viền
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40,bottom: 10),
            width: 85,
            height: 85,
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

          Text(
            'FPT Software',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor2
            ),
            textAlign: TextAlign.center,
          ),

          Text(
            'Logistics - Vận tải',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.placeHolderColor
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}