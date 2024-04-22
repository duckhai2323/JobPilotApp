import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';

class InforComponent extends GetView<JobDetailsController> {
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text(
              "    Thông tin chung",
              style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 20,
              fontWeight: FontWeight.bold
              ),
            ),
            ListTile(
                leading: Icon(Icons.calendar_month),
                iconColor: AppColors.primaryColor1,
                title: Text(
                  'Hình thức',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 10,
                    color: AppColors.placeHolderColor
                  ),
                  ),
                subtitle: Text('Toàn thời gian'),
              ),
            ListTile(
                leading: Icon(Icons.group),
                iconColor: AppColors.primaryColor1,
                title: Text(
                  'Số lượng tuyển',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 10,
                    color: AppColors.placeHolderColor
                  ),
                  ),
                subtitle: Text('5 người'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                iconColor: AppColors.primaryColor1,
                title: Text(
                  'Giới tính',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 10,
                    color: AppColors.placeHolderColor
                  ),
                  ),
                subtitle: Text('Không yêu cầu'),
              ),
              ListTile(
                leading: Icon(Icons.auto_graph),
                iconColor: AppColors.primaryColor1,
                title: Text(
                  'Cấp bậc',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 10,
                    color: AppColors.placeHolderColor
                  ),
                  ),
                subtitle: Text('Nhân viên'),
              ),
              ListTile(
                leading: Icon(Icons.hourglass_bottom),
                iconColor: AppColors.primaryColor1,
                title: Text(
                  'Kinh Nghiệm',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 10,
                    color: AppColors.placeHolderColor
                  ),
                  ),
                subtitle: Text('1 Năm'),
              ),
              ListTile(
                leading: Icon(Icons.av_timer),
                iconColor: AppColors.primaryColor1,
                title: Text(
                  'Hạn nộp hồ sơ',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 10,
                    color: AppColors.placeHolderColor
                  ),
                  ),
                subtitle: Text('30/2/2024'),
              ),
              SizedBox(height: 20,),
              Text(
                "    Mô tả công việc",
                style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "    Yêu cầu ứng viên",
                style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "    Quyền lợi",
                style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "    Địa điểm làm việc",
                style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
              ),
          ],
        ),
      ),
    );
  }
}