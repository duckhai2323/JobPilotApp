import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/application/cv_manage/cv_manage_controller.dart';
import '../../../common/colors/colors.dart';
import 'cv.dart';
import 'cover-letter.dart';

class CVManage extends GetView<CVManageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Quản lý CV",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Container(
            height: MediaQuery.of(context).size.height -
                kToolbarHeight -
                kBottomNavigationBarHeight,
            child: Column(
              children: [
                TabBar(
                    indicator: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 2.0, color: AppColors.primaryColor1))),
                    labelPadding: EdgeInsets.zero,
                    labelColor: AppColors.primaryColor1,
                    tabs: [
                      Tab(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Center(
                              child: Text(
                            "CV",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Center(
                              child: Text(
                            "Cover letter",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          )),
                        ),
                      ),
                    ]),
                Expanded(
                  child: TabBarView(
                    children: [
                      CVTab(),
                      CoverLetter(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
