import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/application/application_controller.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/tabList.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/topcv_profile_controller.dart';

class TopCVProfilePage extends GetView<TopCVProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(12, 40, 12, 40),
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.primaryColor1,
                    height: 150,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hồ sơ của tôi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 10,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color: Colors.white, // Màu của viền
                                  width: 3, // Độ dày của viền
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      ApplicationController.user_image),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          right: 5,
                          bottom: 2,
                          child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.camera_alt)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
              width: MediaQuery.of(context).size.width,
              height: 95,
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ApplicationController.user_name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => {},
                        child: Container(
                          width: MediaQuery.of(context).size.width - 90,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color.fromARGB(66, 215, 213, 213),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit_square,
                                size: 16,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Cập nhật thông tin cơ bản",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => {},
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color.fromARGB(66, 215, 213, 213),
                          ),
                          child: Icon(
                            Icons.remove_red_eye,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            TabList()
          ],
        ),
      ),
    );
  }
}
