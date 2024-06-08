import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/skill/skill_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SkillPage extends GetView<SkillController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomSheet: Container(
          height: 70,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 0.25,
              blurRadius: 3,
              offset: Offset(0, 2),
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  controller.handleAddSkill();
                },
                child: Container(
                  height: 40,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryColor1,
                  ),
                  child: const Center(
                    child: Text(
                      'Thêm mới',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true, // Đặt centerTitle thành true để căn giữa title
          title: Text('Thêm kỹ năng',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton( // Thêm nút back
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: RichText(
                  text: TextSpan(
                    text: "Tên kỹ năng ",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),

                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(color:Colors.red),
                      ),

                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Container(
                height: 45,
                padding: const EdgeInsets.only(left: 15, right: 15),
                margin: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextFormField(
                  controller: controller.textController1,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(

                      hintText:
                      "Nhập tên kỹ năng",
                      hintStyle: TextStyle(
                          color: AppColors.placeHolderColor,
                          fontSize: 14,
                          overflow: TextOverflow.visible),
                      border: InputBorder.none
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(padding: const EdgeInsets.only(left: 15, top: 15), child: Text('Mức độ kỹ năng',
                style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w600,
                  fontSize: 16,),
              ),),
                  Container(
                    child: Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemPadding: const EdgeInsets.all(
                              10.0),
                          itemBuilder: (context, index) =>
                          const Icon(Icons.star, color: Colors.amber,),
                          onRatingUpdate: (rating) =>
                          {
                            controller.rating.value = rating
                          },
                        ),
                      ],
                    ),
                  ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: RichText(
                  text: TextSpan(
                    text: "Mô tả chi tiết ",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Container(
                height: 150,
                padding: const EdgeInsets.only(left: 15, right: 15),
                margin: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextFormField(
                  controller: controller.textController2,
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText:
                      "Nhập mô tả chi tiết",
                      hintStyle: TextStyle(
                          color: AppColors.placeHolderColor,
                          fontSize: 14,
                          overflow: TextOverflow.visible),
                      border: InputBorder.none
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}