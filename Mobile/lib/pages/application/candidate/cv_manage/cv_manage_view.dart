import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../common/colors/colors.dart';
import 'cv.dart';
import 'cover-letter.dart';
import 'cv_manage_controller.dart';

class CVManage extends GetView<CVManageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Center(
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
                    indicator: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 2.0, color: AppColors.primaryColor1))),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColors.primaryColor1,
                    dividerColor: AppColors.bgTextFeild,
                    unselectedLabelColor: AppColors.placeHolderColor,
                    labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: const Center(
                              child: Text(
                            "CV",
                            style: TextStyle(
                              fontWeight: FontWeight.w600
                            ),
                          )),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: const Center(
                              child: Text(
                            "Cover letter",
                            style: TextStyle(
                              fontWeight: FontWeight.w600),
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
