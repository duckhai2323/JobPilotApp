import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/colors/colors.dart';

Widget JobAppliedItem(BuildContext context, logo, job, company, location, salary, time) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10,left: 15,right: 15),
      padding: EdgeInsets.only(bottom: 10,top: 15,left: 20,right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 75,
                height: 75,
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
                  logo,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15,),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width - 175,
                height: 70,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                       job,
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor2
                       ),
                     ),


                     Text(
                        company,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           color: AppColors.placeHolderColor
                        ),
                      ),

                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on_outlined ,size: 15,color: AppColors.primaryColor1,),
              SizedBox(width: 10,),
              Text(
                location,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.currency_exchange_rounded ,size: 15,color: AppColors.primaryColor1,),
              SizedBox(width: 10,),
              Text(
                salary,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 100,),
              Icon(Icons.av_timer_rounded ,size: 15,color: AppColors.primaryColor1,),
              SizedBox(width: 10,),
              Text(
                time,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  fixedSize: const Size(160, 40),
                  elevation: 2,
                  backgroundColor: Color.fromRGBO(218,243,229, 0.8),
                  foregroundColor: AppColors.primaryColor1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () => {},
                child: const Row(
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
              const SizedBox(width: 15),
              TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: const Size(160, 40),
                    elevation: 2,
                    backgroundColor: AppColors.bgTextFeild,
                    foregroundColor: AppColors.primaryColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () => {},
                  child: const Row(
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