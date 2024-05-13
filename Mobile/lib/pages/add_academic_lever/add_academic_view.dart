import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/add_academic_lever/add_academic_controller.dart';


class AddAcademicPage extends GetView<AddAcademicController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
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
              onTap: () {},
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primaryColor1,
                ),
                child: Center(
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
          title: Padding(
        padding: EdgeInsets.only(left: 70),
        child: Text(
          "Thêm học vấn",
          style: TextStyle(
              fontFamily: "Roboto", fontWeight: FontWeight.w600, fontSize: 18),
        ),
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: RichText(
                text: TextSpan(
                  text: "Tên trường học ",
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
              child: TextField(
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                  
                  hintText:
                      "Nhập tên trường học",
                  hintStyle: TextStyle(
                      color: AppColors.placeHolderColor,
                      fontSize: 14,
                      overflow: TextOverflow.visible),
                  border: InputBorder.none
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: RichText(
                text: TextSpan(
                  text: "Chuyên ngành ",
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
              child: TextField(
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                  hintText:
                      "Nhập chuyên ngành",
                  hintStyle: TextStyle(
                      color: AppColors.placeHolderColor,
                      fontSize: 14,
                      overflow: TextOverflow.visible),
                  border: InputBorder.none
                ),
              ),
            ),    
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: RichText(
                text: TextSpan(
                  text: "Thời gian học tập ",
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
            SizedBox(height: 15,),
            Row(
              children: [
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width/2-25,
                  padding: const EdgeInsets.only(left: 15, right: 5),
                  margin: const EdgeInsets.only(left: 15, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)
                    ),
                  child: TextField(
                    expands: true,
                    maxLines: null,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      hintText:
                        
                        "Bắt đầu",
                        hintStyle: TextStyle(
                          color: AppColors.placeHolderColor,
                          fontSize: 14,
                          overflow: TextOverflow.visible),
                        border: InputBorder.none
                    
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width/2-25,
                  padding: const EdgeInsets.only(left: 15, right: 5),
                  margin: const EdgeInsets.only(left: 10, right: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: TextField(
                    expands: true,
                    maxLines: null,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      hintText:
                          "Kết thúc",
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
            Row(
              children: [
                Checkbox(value: false, onChanged: null),
                SizedBox(height: 5,),
                Text(
                  "Tôi đang học ở đây",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Mô tả chi tiết",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.only(left: 15, right: 15),
               decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)
                ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  hintText:
                      "Mô tả chi tiết công việc, những gì đạt được trong quá trình học tập.",
                  hintStyle: TextStyle(
                      color: AppColors.placeHolderColor,
                      fontSize: 14,
                      overflow: TextOverflow.visible),
                  border: InputBorder.none
                )
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
