import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/jobapplied/jobapplied_controller.dart';
import 'package:jobpilot_app/pages/jobapplied/jobapplied_item.dart';

class JobAppliedPage extends GetView<JobAppliedController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTextFeild,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: Icon(Icons.arrow_back_ios),
                floating: true,
                pinned: true,
                centerTitle: true,
                title: Text(
                  'Việc đã ứng tuyển',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: MySliverPersistentHeaderDelegate(
                  TabBar(
                    indicator: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 2.0, color: AppColors.primaryColor1))),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColors.primaryColor1,
                    dividerColor: AppColors.bgTextFeild,
                    unselectedLabelColor: AppColors.placeHolderColor,
                    labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                    tabs: [
                      Tab(child: Text('7 ngày'),),
                      Tab(child: Text('30 ngày'),),
                      Tab(child: Text('Tất cả'),),
                    ],
                  ),
                ),
              ),

            ];
          },
          body: TabBarView(
            children: [
              Center(child: Text('Bạn chưa ứng tuyển việc làm nào'),),
              Center(child: Text('Bạn chưa ứng tuyển việc làm nào'),),
              //Center(child: Text('Tất cả'),),
              ListView.builder(
                itemCount: 10,
                prototypeItem: JobAppliedItem(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.HandleJobDetailPage();
                    },
                    child: JobAppliedItem()
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  MySliverPersistentHeaderDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}