import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/topcv_profile_controller.dart';

class Info extends GetView<TopCVProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        width: MediaQuery.of(context).size.width,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.25,
              blurRadius: 3,
              offset: Offset(0, 2),
            )
          ]
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Thông tin cá nhân",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Xử lý khi nhấn vào nút edit
                      controller.HandleInfoPage();
                    },
                  ),
                 
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add info items here
                  InfoItem(icon: Icons.calendar_today, title: "Ngày sinh", value: "Cập nhật"),
                  InfoItem(icon: Icons.person, title: "Giới tính", value: "Không xác định"),
                  InfoItem(icon: Icons.email, title: "Email", value: "tranduckhai26112003@gmail.com"),
                  InfoItem(icon: Icons.phone, title: "Số điện thoại", value: "Cập nhật"),
                  InfoItem(icon: Icons.location_on, title: "Địa chỉ", value: "Cập nhật"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItem extends GetView<TopCVProfileController> {
  final IconData icon;
  final String title;
  final String value;

  const InfoItem({Key? key, required this.icon, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.2), // Màu xám với độ mờ
            ),
            child: Center(
              child: Icon(
                icon,
                size: 24,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
