import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/topcv_profile_controller.dart';

class SkillCertificate extends GetView<TopCVProfileController> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
     backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.25,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Kỹ năng",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset('assets/images/not_content.png'),
                    ),
                    Center(
                      child: Text(
                        "Chưa có thông tin kỹ năng",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          color: AppColors.placeHolderColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: InkWell(
                        onTap: () {
                          controller.HandleSkillPage();
                        },
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color.fromARGB(66, 215, 213, 213),
                          ),
                          child: Center(
                            child: Text(
                              "Thêm kỹ năng",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.25,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Chứng chỉ",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset('assets/images/not_content.png'),
                    ),
                    Center(
                      child: Text(
                        "Chưa có thông tin chứng chỉ",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          color: AppColors.placeHolderColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: InkWell(
                        onTap: ()  {
                          controller.HandleCertificatePage();
                        },
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color.fromARGB(66, 215, 213, 213),
                          ),
                          child: Center(
                            child: Text(
                              "Thêm chứng chỉ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
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