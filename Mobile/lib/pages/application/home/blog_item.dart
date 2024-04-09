import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/application/home/home_controller.dart';

import '../../../common/colors/colors.dart';

class BlogItem extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 110,
      margin: EdgeInsets.only(bottom: 10,left: 15,right: 5),
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(
        //   color: AppColors.primaryColor1, // Màu của viền
        //   width: 1, // Độ dày của viền
        // ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: MediaQuery.of(context).size.width - 130,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Image.asset(
                  'assets/images/blog1.png',
                  fit: BoxFit.cover,
                ),
              )
          ),

          SizedBox(
            height: 15,
          ),

          const Text(
            'ikigai - Thấu hiểu bản thân, tiếp lợi thế cho hành trình sự nghiệp hạnh phúc với những',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor2
            ),
          ),

          SizedBox(
            height: 5,
          ),

          const Text(
            'ikigai - Thấu hiểu bản thân, tiếp lợi thế cho hành trình sự nghiệp hạnh phúc với những ươcs mơ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.placeHolderColor
            ),
          ),
        ],
      ),
    );
  }
}