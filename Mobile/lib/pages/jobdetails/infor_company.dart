import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/application/home/jobmain_item.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';

import '../../share/job_detail_content.dart';

class InforCompany extends GetView<JobDetailsController> {
  const InforCompany({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget> [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Công ty cổ phần Sun Asterisk",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bgIcon,
                        child: Icon(Icons.location_city,size: 25,color: AppColors.primaryColor1,),
                      ),
                      SizedBox(width: 15,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Địa chỉ công ty',
                            style: TextStyle (
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3,),
                          Text(
                              'Tòa Keangnam Mỹ Đình, Hà Nội',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.bgIcon,
                        child: Icon(Icons.stars,size: 25,color: AppColors.primaryColor1,),
                      ),
                      SizedBox(width: 15,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Website công ty',
                            style: TextStyle (
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 3,),
                          Text(
                            'https://sun-asterisk.vn/',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                JobDetailContent('Giới thiệu công ty',  'Tốt nghiệp đại học trở lên Thành thạo các kỹ năng mềm cơ bản: thuyết trình, giao tiếp, làm việc nhóm...Có khả năng thúc đẩy tư duy tích cực, sử dụng trò chơi và tạo cảm hứng trong giảng dạy.Sử dụng thành thạo các công cụ thiết kế bài giảng và hỗ trợ giảng dạy.Trung thực, nhiệt huyết và có tinh thần cầu thị', context),
                const Padding(
                  padding: EdgeInsets.only(left: 15,top: 15,bottom: 15),
                  child: Text(
                    "Việc làm cùng công ty",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return InkWell(onTap: () {controller.HandleJobdetails();},child: JobMainItem());
              },
            childCount: 3,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 100,),
          ),
        ],
      ),
    );
  }
}