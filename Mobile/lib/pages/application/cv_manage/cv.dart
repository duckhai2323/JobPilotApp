import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/application/cv_manage/cv_manage_controller.dart';
import '../../../common/colors/colors.dart';

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
                Row(
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
                SizedBox(
                  height: 16,
                ),
                Text(
                  "CV đã tạo trên TopCV",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  width: (MediaQuery.of(context).size.width - 16 - 16) / 2,
                  height: 220,
                  decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: Color.fromARGB(255, 218, 216, 216)),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 218, 216, 216))),
                            color: Color.fromARGB(66, 215, 213, 213),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.image,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Icon(
                                  Icons.stars_rounded,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 68,
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CV ứng tuyển",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "13/06/2024 12:00",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                Icon(
                                  Icons.more_horiz,
                                  color: Colors.grey,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "CV đã tải lên TopCV",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 14),
                Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 218, 216, 216)),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/doc.png',
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        "Chưa có CV nào được tải lên",
                        style: TextStyle(
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "Tải lên CV có sẵn trên thiết bị để tiếp cận với nhà tuyển dụng",
                        style: TextStyle(
                          color: Colors.grey
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 40),
                          elevation: 2,
                          backgroundColor: AppColors.primaryColor1,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () => {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                            ),
                            SizedBox(width: 4,),
                            Text(
                              "Tải CV ngay"
                            )
                          ],
                        )
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "TopCV Profile",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 14),
                Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 218, 216, 216)),
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/doc.png',
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        "Chưa khởi tạo Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "Tạo hồ sơ chuyên nghiệp, xây dựng thương hiệu cá nhân với TopCV profile",
                        style: TextStyle(
                          color: Colors.grey
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 40),
                          elevation: 2, 
                          backgroundColor: AppColors.primaryColor1,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () => {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                            ),
                            SizedBox(width: 4,),
                            Text(
                              "Tạo TopCV Profile"
                            )
                          ],
                        )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 120,)
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: AppColors.primaryColor1
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        )
      ]
    );
  }
}
