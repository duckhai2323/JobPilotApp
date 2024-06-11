import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/application/cv_manage/topcv_profile_page/topcv_profile_controller.dart';

class AcademicLever extends GetView<TopCVProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(
          ()=> controller.universities.isNotEmpty?Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 20),
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
            width :  MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.25,
                    blurRadius: 3,
                    offset: Offset(0,2),
                  )
                ]
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Học vấn",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        controller.HandleAddAcademicLeverPage();
                      },
                      child: const CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.backgroundColor,
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 15),
                    itemCount: controller.universities.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width-60,
                        height: 95,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/default.jpg')
                                )
                              ),
                            ),

                            const SizedBox(width: 15,),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.universities[index].univer_name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),

                                  Text(
                                    controller.universities[index].specialized,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.placeHolderColor,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),

                                  Text(
                                    '${controller.universities[index].start_uni} - ${controller.universities[index].end_uni}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.placeHolderColor,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const Padding(
                              padding: EdgeInsets.only(top: 50,right: 10),
                              child: Icon(Icons.edit,size: 20,),
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ): Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
          width :  MediaQuery.of(context).size.width,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0.25,
                  blurRadius: 3,
                  offset: Offset(0,2),
                )
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  "Học vấn",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Center(
                child: Image.asset('assets/images/not_content.png')
              ),
              const Center(
                child: Text(
                  "Chưa có thông tin học vấn",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    color: AppColors.placeHolderColor
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: InkWell(
                  onTap: () => {
                    controller.HandleAddAcademicLeverPage()
                  },
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(66, 215, 213, 213),
                    ),
                    child: const Center(
                      child: Text(
                        "Thêm học vấn",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
