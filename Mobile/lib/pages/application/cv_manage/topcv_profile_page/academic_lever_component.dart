import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/topcv_profile_controller.dart';

class AcademicLever extends GetView<TopCVProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        width :  MediaQuery.of(context).size.width,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.25,
                blurRadius: 3,
                offset: Offset(0,2),
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Text(
                "Học vấn",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: Image.asset('assets/images/not_content.png')
            ),
            const Center(
              child: Text(
                "Chưa có thông tin học vấn",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  color: AppColors.placeHolderColor
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: InkWell(
                onTap: () => {
                  controller.HandleAddAcademicLeverPage()
                },
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(66, 215, 213, 213),
                  ),
                  child: Center(
                    child: Text(
                      "Thêm học vấn",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
