import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/jobdetails/infor_company.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';
import 'package:jobpilot_app/pages/jobdetails/relatedjobs_component.dart';

import 'information_component.dart';

class JobDetailsPage extends GetView<JobDetailsController> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return Scaffold(
      bottomSheet: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 0.25,
                blurRadius: 3,
                offset: Offset(0,2),
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.primaryColor1,
                  width: 1,
                ),
              ),
              child: Icon(Icons.bookmark_border,size: 30,color: AppColors.primaryColor1,),
            ),
            SizedBox(width: 10,),
            Container(
              height: 40,
              //margin: EdgeInsets.only(left: 70),
              width: MediaQuery.of(context).size.width-85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primaryColor1,
              ),
              child: Center(
                child: Text(
                  'Ứng tuyển ngay',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          controller: controller.scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget> [
             Obx(() =>  SliverAppBar(
               titleSpacing: 0,
               automaticallyImplyLeading: false,
               pinned: true,
               toolbarHeight: controller.isSliverAppBarExpanded.value?kToolbarHeight:0,
               backgroundColor: Colors.white,
               title:controller.isSliverAppBarExpanded.value? Container(
                 width: screenWidth,
                 color: Colors.white,
                 height: 70,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   mainAxisSize: MainAxisSize.max,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     const SizedBox(width: 30,),
                     const Icon(Icons.arrow_back,size: 25,),
                     Container(
                       width: screenWidth - 130,
                       margin: const EdgeInsets.only(left: 10),
                       child: const Text(
                         'Nhân viên Nghiên Cứu và phát triển Conng nghệ nhiều đãi ngộ, hsdfhdf sfshfs sdfhsfjs',
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                         style: TextStyle(
                             fontFamily: 'Roboto',
                             fontSize: 16,
                             fontWeight: FontWeight.w500,
                             color: AppColors.primaryColor2
                         ),
                       ),
                     ),
                     const Padding(
                       padding: EdgeInsets.only(left: 15),
                       child: Icon(Icons.more_horiz,size: 30,),
                     )
                   ],
                 ),
               ):null,
             ),),
              SliverToBoxAdapter(
                child: Container(
                  height: screenHeight*1/2+10,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.primaryColor1,Colors.white]
                      )
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 20,
                        left: 20,
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_back,size: 25,),
                        ),
                      ),

                      const Positioned(
                        top: 20,
                        right: 20,
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.more_horiz,size: 25,),
                        ),
                      ),
                      Positioned(
                        top: screenHeight*3/8,
                        child: Container(
                          height: 300,
                          width: screenWidth,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: 90,
                        left: 15,
                        right: 15,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 0.25,
                                  blurRadius: 2,
                                  offset: Offset(0,2),
                                )
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height:65),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Fresher Developer FrontEnd tại Toà Keangnam Mỹ Đình, Hà Nội',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryColor2
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'CÔNG TY CỔ PHẦN SUN ASTERISK',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryColor2
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                                child: Divider(
                                  color: AppColors.bgTextFeild,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                decoration: const BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          decoration: const BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                            ),
                                            border: Border(
                                              right: BorderSide(
                                                color: AppColors.bgTextFeild,
                                                width: 1.0,
                                              ),
                                            ),

                                          ),
                                          height: 90,
                                          child: const Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 5),
                                              Icon(Icons.monetization_on, size: 40, color: AppColors.primaryColor1,),
                                              SizedBox(height: 5),
                                              Text(
                                                "Mức Lương",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.placeHolderColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                '20-25 triệu',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.primaryColor1
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          decoration: const BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                            ),
                                            border: Border(
                                              right: BorderSide(
                                                color: AppColors.bgTextFeild,
                                                width: 1.0,
                                              ),
                                            ),

                                          ),
                                          height: 90,
                                          child: const Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 5),
                                              Icon(Icons.location_on, size: 40, color: AppColors.primaryColor1,),
                                              SizedBox(height: 5),
                                              Text(
                                                "Địa điểm",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.placeHolderColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'Cầu giấy, Hà Nội',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.primaryColor1
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          decoration: const BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                            ),
                                            border: Border(
                                              right: BorderSide(
                                                color: AppColors.bgTextFeild,
                                                width: 1.0,
                                              ),
                                            ),

                                          ),
                                          height: 90,
                                          child: const Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 5),
                                              Icon(Icons.star, size: 40, color: AppColors.primaryColor1,),
                                              SizedBox(height: 5),
                                              Text(
                                                "Kinh nghiệm",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.placeHolderColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'Cần 10 năm kinh nghiệm',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.primaryColor1
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: mediaQueryData.size.width/2 - 40,
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 0.25,
                                  blurRadius: 2,
                                  offset: const Offset(0,2),
                                )
                              ]
                          ),
                          child: Image.asset(
                            'assets/images/sun.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: MySliverPersistentHeaderDelegate (
                  const TabBar(
                    isScrollable: true,
                    labelColor: AppColors.primaryColor1,
                    dividerColor: AppColors.bgTextFeild,
                    unselectedLabelColor: AppColors.placeHolderColor,
                    tabAlignment: TabAlignment.start,
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),
                    tabs: [
                      Tab(child: Text('Thông tin'),),
                      Tab(child: Text('Việc làm liên quan'),),
                      Tab(child: Text('Công ty'),),
                      Tab(child: Text('Mức độ cạnh tranh'),),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              InforComponent(),
              RelatedJobs(),
              const InforCompany(),
              const Center(child: Text('Mức độ cạnh tranh'),),
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