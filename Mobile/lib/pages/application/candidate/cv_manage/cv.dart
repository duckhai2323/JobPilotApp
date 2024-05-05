import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/share/made_cv.dart';
import 'package:jobpilot_app/share/upload_or_create_cv.dart';
import 'package:jobpilot_app/share/topcv_profile.dart';
import '../../../../common/colors/colors.dart';
import 'cv_manage_controller.dart';

class CVTab extends GetView<CVManageController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "THƯ VIỆN CV",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.format_list_bulleted,
                      size: 28,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "CV đã tạo trên TopCV",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 14,
                ),
                MADECV(context, "", "13/06/2024 12:00"),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "CV đã tải lên TopCV",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 14),
                UploadOrCreateCV(
                  context, 
                  "Chưa có CV nào được tải lên",
                  "Tải lên CV có sẵn trên thiết bị để tiếp cận với nhà tuyển dụng", 
                  "Tải CV ngay",
                  150, 40,
                  () => {}
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "TopCV Profile",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 14),
                // UploadOrCreateCV(
                //   context, 
                //   "Chưa khởi tạo Profile", 
                //   "Tạo hồ sơ chuyên nghiệp , xây dựng thương hiệu cá nhân với TopCV profile", 
                //   "Tạo TopCV Profile", 
                //   200, 40,
                //   () => {}
                // ),
                TopCVProfile(
                  context,
                  "",
                  "Vũ Hưng",
                  "13/06/2024 12:00"
                ),
                const SizedBox(height: 120,)
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          right: 16,
          child: Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: AppColors.primaryColor1
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        )
      ]
    );
  }
}
