import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/application/home/home_controller.dart';

import '../../../common/colors/colors.dart';

class JobMainItem extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10,left: 15,right: 15),
      padding: EdgeInsets.only(bottom: 10,top: 15,left: 15,right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColors.primaryColor1,
          width: 1,
        ),
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fresher Developer FrontEnd',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor2
                      ),
                    ),

                    //SizedBox(height: 5,),

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

                    SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 5),
                          decoration: BoxDecoration(
                            color: AppColors.bgSearch,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Center(
                            child: Text(
                              'Hà Nội',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor2
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 10,),

                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 5),
                          decoration: BoxDecoration(
                            color: AppColors.bgSearch,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Center(
                            child: Text(
                              '3 năm',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor2
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8,),

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 5),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(243, 249, 245, 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Center(
                            child: Text(
                              '300 USD',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor1
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.bookmark_outline_rounded, color: AppColors.placeHolderColor,size: 30,),
            ],
          ),
          Divider(color: AppColors.bgTextFeild,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.access_time_filled,size: 20,color: AppColors.placeHolderColor,),
              SizedBox(width: 5,),
              RichText(
                text: const TextSpan(
                  text: 'Còn ',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.placeHolderColor,
                    fontWeight: FontWeight.w500,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: '29 ', style: TextStyle(color: AppColors.primaryColor2,)),
                    TextSpan(text: 'ngày để ứng tuyển'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}