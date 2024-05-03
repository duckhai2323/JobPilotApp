import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/colors/colors.dart';

class JobSubItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10,left: 15,right: 15),
      padding: EdgeInsets.only(bottom: 10,top: 15,left: 15,right: 15),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          '8-12 triệu',
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

              ],
            ),
          ),
          Icon(Icons.bookmark_outline_rounded, color: AppColors.placeHolderColor,size: 30,),
        ],
      ),
    );
  }
}