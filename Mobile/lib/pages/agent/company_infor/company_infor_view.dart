import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/agent/company_infor/company_infor_controller.dart';
import 'package:jobpilot_app/share/jobsub_item.dart';

import '../../../share/job_detail_content.dart';

class CompanyInforPage extends GetView<CompanyInforController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color.fromRGBO(	27, 74, 67,1),Color.fromRGBO(2, 171, 79,1)],
                      transform: GradientRotation(-pi/2)
                  )
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/company_infor_image.jpg'),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),

                  Positioned(
                    top: 35,
                    right: 20,
                    child: Container(
                      width: 70,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.settings,size: 25,color: AppColors.primaryColor1,),
                          SizedBox(width: 5,),
                          Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:AppColors.primaryColor1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Positioned(
                    top: 80,
                    left: 20,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundColor: Colors.white,
                      backgroundImage: CachedNetworkImageProvider('https://sun-asterisk.vn/wp-content/uploads/2020/11/intro-business.png'),
                    ),
                  ),

                  Positioned(
                    left: 125,
                    bottom: 15,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*2/3,
                      height: 60,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cty Sun Asterisk VN - Sun* Awesome',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),

                          SizedBox(height: 5,),

                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(CupertinoIcons.globe,size: 20,color: Colors.white,),
                                  SizedBox(width: 10,),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      'http//:sun-asterisk.com',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.business,size: 20,color: Colors.white,),
                                  SizedBox(width: 10,),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      '200 nhan vien',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thong tin cong ty',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bgIcon,
                        child: Icon(Icons.location_city,size: 25,color: AppColors.primaryColor1,),
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Địa chỉ công ty',
                            style: TextStyle (
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width-90,
                            child: const Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              'Tòa Keangnam Mỹ Đình, Hà Nội',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bgIcon,
                        child: Icon(Icons.calendar_month,size: 24,color: AppColors.primaryColor1,),
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nam thanh lap',
                            style: TextStyle (
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width-90,
                            child: const Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              't9/2011',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bgIcon,
                        child: Icon(Icons.phone,size: 24,color: AppColors.primaryColor1,),
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'So dien thoai',
                            style: TextStyle (
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width-90,
                            child: const Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              '0987567567',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bgIcon,
                        child: Icon(Icons.people,size: 24,color: AppColors.primaryColor1,),
                      ),
                      const SizedBox(width: 15,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nguoi theo doi',
                            style: TextStyle (
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width-90,
                            child: const Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              '300',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(bottom: 15),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: JobDetailContent('Gioi thieu cong ty',  'Tốt nghiệp đại học trở lên Thành thạo các kỹ năng mềm cơ bản: thuyết trình, giao tiếp, làm việc nhóm...Có khả năng thúc đẩy tư duy tích cực, sử dụng trò chơi và tạo cảm hứng trong giảng dạy.Sử dụng thành thạo các công cụ thiết kế bài giảng và hỗ trợ giảng dạy.Trung thực, nhiệt huyết và có tinh thần cầu thị', context),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Text(
                'Viec lam dang hien thi',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

            ListView.builder(
              padding: const EdgeInsets.only(top: 15),
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return JobSubItem();
              },
            ),


          ],
        ),
      ),
    );
  }
}