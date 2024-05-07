import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/main.dart';
import 'package:jobpilot_app/pages/jobdetails/item_warn.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';
import 'package:jobpilot_app/share/icon_job_details.dart';
import 'package:jobpilot_app/share/job_detail_content.dart';

class InforComponent extends GetView<JobDetailsController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(()=> controller.jobDetails.isNotEmpty?Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15,),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Thông tin chung",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Obx(()=> IconJobDetails(const Icon(Icons.hourglass_bottom,size: 25,color: AppColors.primaryColor1,), 'Kinh nghiệm', controller.jobDetails[0].experience_require)),
            Obx(()=>IconJobDetails(const Icon(Icons.calendar_month,size: 25,color: AppColors.primaryColor1,), 'Hình thức', controller.jobDetails[0].work_form)),
            Obx(()=> IconJobDetails(const Icon(Icons.group,size: 25,color: AppColors.primaryColor1,), 'Số lượng tuyển', controller.jobDetails[0].candidate_number.toString()+' người')),
            IconJobDetails(const Icon(Icons.person,size: 25,color: AppColors.primaryColor1,), 'Giới tính', 'Không yêu cầu'),
            IconJobDetails(const Icon(Icons.auto_graph,size: 25,color: AppColors.primaryColor1,),  'Cấp bậc', 'Nhân viên'),
            Obx(()=> IconJobDetails(const Icon(Icons.av_timer,size: 25,color: AppColors.primaryColor1,),  'Hạn nộp hồ sơ',controller.jobDetails[0].deadline_job)),
            const SizedBox(height: 5,),
            Obx(()=> JobDetailContent('Mô tả công việc',  controller.jobDetails[0].job_details, context)),
            Obx(()=>JobDetailContent('Yêu cầu ứng viên', controller.jobDetails[0].job_require, context)),
            JobDetailContent('Quyền lợi',  controller.jobDetails[0].job_benefit, context),
            JobDetailContent('Địa điểm làm việc',  controller.jobDetails[0].job_location, context),
            const Padding(
              padding: EdgeInsets.only(left: 15,top:20),
              child: Text(
                "Bí kíp tìm việc an toàn",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              height: 860,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Dưới đây là những dấu hiệu của các tổ chức, cá nhân tuyển dụng không minh bạch:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),

                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.bgTextFeild,
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Dấu hiệu phổ biến',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: 330,
                    //color: Colors.amber,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 30,
                          left: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width-60,
                            height: 250,
                            //color: Colors.blue,
                            child: PageView(
                              controller: controller.pageController,
                              onPageChanged: (index){
                                controller.ChangePageView(index);
                              },
                              children: <Widget>[
                                ItemWarn('assets/images/warn1.jpg', 'Nội dung mô tả công việc sơ sài, không đồng nhất với công việc thực tế'),
                                ItemWarn('assets/images/warn2.jpg', 'Hứa hẹn "việc nhẹ lương cao", không cần bỏ nhiều công sức dễ dàng lấy tiền "khủng"'),
                                ItemWarn('assets/images/warn3.jpg', 'Yêu cầu tải app, nạp tiền, làm nghiệm vụ'),
                                ItemWarn('assets/images/warn4.jpg', 'Yêu cầu nộp phí phỏng vấn, phí giữ chỗ...'),
                                ItemWarn('assets/images/warn5.jpg', 'Yêu cầu ký giấy tờ không rõ ràng hoặc thu giấy tờ gốc'),
                                ItemWarn('assets/images/warn6.jpg', 'Địa điểm phỏng vấn bất thường'),

                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          child: Obx(() => Container(
                            width: MediaQuery.of(context).size.width-60,
                            child: Center(
                              child: DotsIndicator(
                                dotsCount: 6,
                                position:controller.statePageView.value,
                                mainAxisAlignment: MainAxisAlignment.start,
                                decorator: DotsDecorator(
                                  activeColor:AppColors.primaryColor1,
                                  size: const Size.square(9.0),
                                  activeSize: const Size(10.0, 10.0),
                                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ),
                            ),
                          )),
                        ),

                        Positioned(
                          top: 150,
                          left: 15,
                          child: InkWell(
                            onTap: (){
                              controller.RevertPageView();
                            },
                            child: const CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.primaryColor1,
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Icon(Icons.arrow_back_ios,color: AppColors.primaryColor1,size: 20,),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 150,
                          right: 15,
                          child: InkWell(
                            onTap: (){
                              controller.NextPageView();
                            },
                            child: const CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.primaryColor1,
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.primaryColor1,size: 20,),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.bgTextFeild,
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width-110,
                        child: const Text(
                          'Cần làm gì khi gặp việc làm, công ty không minh bạch:',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(MyApp.dot),
                      Container(
                        margin: const EdgeInsets.only(left: 3),
                        width: MediaQuery.of(context).size.width-90,
                        child: const Text(
                          'Kiểm tra thông tin về công ty, việc làm trước khi ứng tuyển',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(MyApp.dot),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: MediaQuery.of(context).size.width-90,
                        child: const Text(
                          'Báo cáo tin tuyển dụng với JobPilot thông qua nút "Báo cáo tin tuyển dụng" để được hỗ trợ và giúp các ứng viên tránh được rủi ro',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(MyApp.dot),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: MediaQuery.of(context).size.width-90,
                        child: const Text(
                          'Hoặc liên hệ với JobPilot thông qua kênh hỗ trợ ứng viên của JobPilot:',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.email_outlined,color: AppColors.primaryColor1,size: 25,),
                      SizedBox(width: 5,),
                      Text(
                        'Email: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: AppColors.placeHolderColor
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        'hotro@jobpilot.com',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor1
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.phone,color: AppColors.primaryColor1,size: 25,),
                      SizedBox(width: 5,),
                      Text(
                        'Hotline: ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: AppColors.placeHolderColor
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        '(024) 8866 6688',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor1
                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 49),
                    width: MediaQuery.of(context).size.width-60,
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.bgTextFeild,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.flag,size: 25,color: Colors.black,),
                        SizedBox(width: 15,),
                        Text(
                          'Báo cáo tin tuyển dụng',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100,),

          ],
        ):Container()),
      ),
    );
  }
}