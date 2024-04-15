import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/application/profile/item_grid.dart';
import 'package:jobpilot_app/pages/application/profile/item_setting.dart';
import 'package:jobpilot_app/pages/application/profile/profile_controller.dart';
import 'package:jobpilot_app/pages/application/profile/profile_infor.dart';

import '../../../common/colors/colors.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileInfor(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kinh nghiệm làm việc',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'Sửa',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor1,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 25,
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: AppColors.bgTextFeild,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Dưới 1 năm',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: AppColors.bgTextFeild,
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Công việc mong muốn',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'Sửa',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor1,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 25,
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: AppColors.bgTextFeild,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Developer Flutter',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: AppColors.bgTextFeild,
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Địa điểm làm việc mong muốn',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'Sửa',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor1,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 25,
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: AppColors.bgTextFeild,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hà Nội',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Text(
                'Quản lý hồ sơ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.insert_chart,size: 30,color: AppColors.primaryColor1,),
                      SizedBox(width: 15,),
                      Text(
                        'Trạng thái tìm việc',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Switch(
                    value: true,
                    activeColor: AppColors.primaryColor1,
                    onChanged: (value){
                    },
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: AppColors.bgTextFeild,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.perm_contact_calendar,size: 30,color: AppColors.primaryColor1,),
                      SizedBox(width: 15,),
                      Text(
                        'Cho phép NTD liên hệ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Switch(
                    value: true,
                    activeColor: AppColors.primaryColor1,
                    onChanged: (value){
                    },
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Text(
                'Quản lý tìm việc',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemGrid(Icon(Icons.business_center,size: 30,color: AppColors.primaryColor1,),'Việc làm đã ứng tuyển', '10'),
                  ItemGrid(Icon(Icons.bookmarks_rounded,size: 30,color: AppColors.primaryColor1,),'Việc làm đã lưu', '13')
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemGrid(Icon(Icons.check_circle,size: 30,color: AppColors.primaryColor1,),'Việc làm phù hợp', '10'),
                  ItemGrid(Icon(Icons.groups,size: 30,color: AppColors.primaryColor1,),'Công ty đang theo dõi', '10'),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemGrid(Icon(Icons.visibility,size: 30,color: AppColors.primaryColor1,),'NTD đã xem hồ sơ', '10'),
                  ItemGrid(Icon(Icons.settings,size: 30,color: AppColors.primaryColor1,),'Cài đặt gợi ý việc làm', '10'),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemGrid(Icon(Icons.notifications_rounded,size: 30,color: AppColors.primaryColor1,),'Thông báo việc làm', '10'),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/blog1.png'),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Text(
                'Cài đặt tài khoản',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            ItemSetting(const Icon(Icons.stars_outlined,size: 26,color: AppColors.placeHolderColor),'Nâng cấp tài khoản'),
            ItemSetting(const Icon(Icons.card_giftcard_rounded,size: 26,color: AppColors.placeHolderColor),'Kích hoạt quà tặng'),
            ItemSetting(const Icon(Icons.key,size: 26,color: AppColors.placeHolderColor),'Đổi mật khẩu'),
            ItemSetting(const Icon(Icons.security,size: 26,color: AppColors.placeHolderColor),'Cài đặt bảo mật'),
            ItemSetting(const Icon(Icons.alternate_email,size: 26,color: AppColors.placeHolderColor),'Cài đặt thông báo trong email'),
            ItemSetting(const Icon(Icons.lock_outline,size: 26,color: AppColors.placeHolderColor),'Vô hiệu hóa tài khoản'),
            ItemSetting(const Icon(Icons.logout,size: 26,color: AppColors.placeHolderColor),'Đăng xuất tài khoản'),

            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

}