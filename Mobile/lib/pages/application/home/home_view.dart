import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/application/home/blog_item.dart';
import 'package:jobpilot_app/pages/application/home/company_item.dart';
import 'package:jobpilot_app/pages/application/home/home_controller.dart';
import 'package:jobpilot_app/share/jobmain_item.dart';
import 'package:jobpilot_app/share/jobsub_item.dart';

class HomePage extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Colors.white,
            toolbarHeight: 70,
            expandedHeight: 130,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 15, bottom: 15),
              centerTitle: false,
              expandedTitleScale: 1,
              title: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width-100,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 49,
                      decoration: BoxDecoration(
                        color:Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.25,
                              blurRadius: 10,
                              offset: Offset(0,2),
                            )
                          ]
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(Icons.search, size: 30, color: AppColors.primaryColor1,),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Tìm kiếm theo ngành...',
                            style: TextStyle(
                              color: AppColors.placeHolderColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 15),
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color:Colors.grey.shade50,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.25,
                              blurRadius: 10,
                              offset: Offset(0,2),
                            )
                          ],
                      ),

                      child: InkWell(
                        onTap: (){
                          controller.HandleNotifiPage();
                        },
                        child: const Center(
                          child: Icon(Icons.notifications_active,size: 25, color: AppColors.primaryColor1,),
                        ),
                      ),
                    )
                  ],
                )
              ),
              background: Container(
                padding: const EdgeInsets.only(bottom: 20,left: 40),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.primaryColor1,Colors.white]
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width:60, height:60,child: Image.asset('assets/images/mascot-1.png')),
                    const Text(
                      'Chào mng bạn đến với JobPilot',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Gợi ý việc làm phù hợp',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor2,
                    ),
                  ),

                  Text(
                    'Xem tất cả',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor1,
                    ),
                  ),
                ],
              ),
            )
          ),
          Obx(() => SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return InkWell(onTap: () {controller.HandleJobdetails();},child: JobMainItem(
                  context,
                  controller.listJobs[index].company_image,
                  controller.listJobs[index].company_name,
                  controller.listJobs[index].job_title,
                  controller.listJobs[index].job_location,
                  controller.listJobs[index].experience_require,
                  controller.listJobs[index].salary
                ));
              },
              childCount: controller.listJobs.length>3?3:controller.listJobs.length,
            ),
          ),),

          SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 15,right:15,top: 15),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Việc làm hấp dẫn',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor2,
                      ),
                    ),

                    Text(
                      'Xem tất cả',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor1,
                      ),
                    ),
                  ],
                ),
              )
          ),

          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 610,
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index){
                      controller.ChangePageView(index);
                    },
                    children: <Widget>[
                      ListView.builder(
                        padding: EdgeInsets.only(top: 10),
                        itemCount: 4,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return JobSubItem(
                            "https://wsm.sun-asterisk.vn/assets/logo_framgia-58c446c37727ba4bc8317121c321edd3d4ed081787fac85cb08240dcef9dd062.png",
                            "Cty Phat Trien Phan Mem Sun Asterisk",
                            'Tuyen Lap Trinh Vien Fresher WEB MOBILE',
                            'Ha Noi',
                            '1 nam',
                            '300s',
                          );
                        },
                      ),
                      ListView.builder(
                        padding: EdgeInsets.only(top: 10),
                        itemCount: 4,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return JobSubItem(
                            "https://wsm.sun-asterisk.vn/assets/logo_framgia-58c446c37727ba4bc8317121c321edd3d4ed081787fac85cb08240dcef9dd062.png",
                            "Cty Phat Trien Phan Mem Sun Asterisk",
                            'Tuyen Lap Trinh Vien Fresher WEB MOBILE',
                            'Ha Noi',
                            '1 nam',
                            '300s',
                          );
                        },
                      ),
                      ListView.builder(
                        padding: EdgeInsets.only(top: 10),
                        itemCount: 4,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return JobSubItem(
                            "https://wsm.sun-asterisk.vn/assets/logo_framgia-58c446c37727ba4bc8317121c321edd3d4ed081787fac85cb08240dcef9dd062.png",
                            "Cty Phat Trien Phan Mem Sun Asterisk",
                            'Tuyen Lap Trinh Vien Fresher WEB MOBILE',
                            'Ha Noi',
                            '1 nam',
                            '300s',
                          );
                        },
                      ),
                      ListView.builder(
                        padding: EdgeInsets.only(top: 10),
                        itemCount: 4,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return JobSubItem(
                            "https://wsm.sun-asterisk.vn/assets/logo_framgia-58c446c37727ba4bc8317121c321edd3d4ed081787fac85cb08240dcef9dd062.png",
                            "Cty Phat Trien Phan Mem Sun Asterisk",
                            'Tuyen Lap Trinh Vien Fresher WEB MOBILE',
                            'Ha Noi',
                            '1 nam',
                            '300s',
                          );
                        },
                      ),
                      ListView.builder(
                        padding: EdgeInsets.only(top: 10),
                        itemCount: 4,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return JobSubItem(
                            "https://wsm.sun-asterisk.vn/assets/logo_framgia-58c446c37727ba4bc8317121c321edd3d4ed081787fac85cb08240dcef9dd062.png",
                            "Cty Phat Trien Phan Mem Sun Asterisk",
                            'Tuyen Lap Trinh Vien Fresher WEB MOBILE',
                            'Ha Noi',
                            '1 nam',
                            '300s',
                          );
                        },
                      )
                    ],
                  ),
                ),
                Obx(() => DotsIndicator(
                  dotsCount: 5,
                  position:controller.statePageView.value,
                  decorator: DotsDecorator(
                    activeColor:AppColors.primaryColor1,
                    size: const Size.square(8.0),
                    activeSize: const Size(10.0, 10.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                )),
              ],
            ),
          ),

          SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(left: 15,right:15,top: 5,bottom: 10),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Top Công ty hàng đầu',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor2,
                      ),
                    ),
                      InkWell(
                        onTap: (){
                          controller.HandleCompaniesPage();
                        },
                      child: const Text(
                      'Xem tất cả',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor1,
                      ),
                    ),
                  )
              ],
            ),
          )
        ),

          Obx(() => SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width/2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return CompanyItem(
                    logo: controller.listCompanies[index].company_image,
                    name: controller.listCompanies[index].company_name,
                    description: controller.listCompanies[index].company_filed,
                  );
                },
                childCount: controller.listCompanies.length>=4?4:controller.listCompanies.length,
              ),
            ),
          ),),

          SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(left: 15,right:15,top: 10,bottom: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Kinh nghiệm thành công',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor2,
                      ),
                    ),

                    Text(
                      'Xem tất cả',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor1,
                      ),
                    ),
                  ],
                ),
              )
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return BlogItem();
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}