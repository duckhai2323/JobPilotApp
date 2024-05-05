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
              height: 190,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/company_infor_image.jpg'),
                            fit: BoxFit.cover
                        )
                    ),
                    height: 140,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 15,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hồ sơ của tôi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 15,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
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
              padding: EdgeInsets.fromLTRB(15,5,15,0),
              width: MediaQuery.of(context).size.width,
              height: 95,
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ApplicationController.user_name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
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
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color.fromARGB(66, 215, 213, 213),
                          ),
                          child: const Row(
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
                                    fontSize: 14, fontWeight: FontWeight.bold),
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
                          decoration:BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            color: const Color.fromARGB(66, 215, 213, 213),
                            border: Border.all(width: 1,color: AppColors.placeHolderColor),
                          ),
                          child: const Icon(
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
