import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/academic_lever_component.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/experience_component.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/info.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/skill&certificate.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/topcv_profile_controller.dart';

class TabList extends GetView<TopCVProfileController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DefaultTabController(
        length: 4,
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              kToolbarHeight -
              kBottomNavigationBarHeight,
          child:  Column(
            children: [
              TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  indicator: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 2.0, color: AppColors.primaryColor1))),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: AppColors.primaryColor1,
                  dividerColor: AppColors.bgTextFeild,
                  unselectedLabelColor: AppColors.placeHolderColor,
                  labelStyle: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  tabs: [
                    // Tab(
                    //   child: SizedBox(
                    //
                    //     child: Center(
                    //         child: Text(
                    //       "Giới thiệu",
                    //       style: TextStyle(fontWeight: FontWeight.w600),
                    //     )),
                    //   ),
                    // ),
                    Tab(
                      child: SizedBox(
                        
                        child: Center(
                            child: Text(
                          "Kinh nghiệm",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        
                        child: Center(
                            child: Text(
                          "Học vấn",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        
                        child: Center(
                            child: Text(
                          "Kỹ năng & chứng chỉ",
                          style: TextStyle(fontWeight: FontWeight.w600),
                          
                            )
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        
                        child: Center(
                            child: Text(
                          "Thông tin cá nhân",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        
                        child: Center(
                            child: Text(
                          "Khác",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                  ]),
              Expanded(
                child: TabBarView(
                  children: [
                    // Text("Giới thiệu"),
                    Experience(),
                    AcademicLever(),
                    SkillCertificate(),
                    Info(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
