import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/info/info_controller.dart';

class InfoPage extends GetView<InfoController> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          title: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          "Cập nhật thông tin cá nhân",
           textAlign: TextAlign.center,
           style: TextStyle(
              fontFamily: "Roboto", fontWeight: FontWeight.w600, fontSize: 18),
        ),
       ),
          leading: IconButton( // Thêm nút back
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
         body: SingleChildScrollView(  
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
             Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: RichText(
                text: TextSpan(
                  text: "Ngày sinh",
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
               SizedBox(
                       height: 10,
                       
               ),
              Row(
              children: [
                InkWell(onTap: () {
                  controller.showDialogTime(context, "birth");
                }, child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width-30,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: controller.textController1,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(onTap: () {controller.showDialogTime(context, 'birth');},child: Icon(Icons.calendar_month)),
                        suffixIconConstraints: BoxConstraints(minWidth: 20),
                        hintText:

                        "Ngày sinh của bạn",

                        hintStyle: TextStyle(
                            color: AppColors.placeHolderColor,
                            fontSize: 14,
                            overflow: TextOverflow.visible
                        ),
                        border: InputBorder.none

                    ),
                  ),
                ),),

              ]
              ),
              SizedBox(height: 16),
              Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: RichText(
                text: TextSpan(
                  text: "Giới tính",
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
            SizedBox(
                       height: 10,
                       
               ),
              Obx(() => Row(
             children: [
               Radio(
                 value: 1,
                 groupValue: controller.value_.value,
                 onChanged: (value) {
                   controller.ActionRadio(value!);
                 },
               ),
               const Text(
                 'Nam ',
                 style: TextStyle(
                     color: AppColors.placeHolderColor,
                     fontSize: 16,
                     fontFamily: "Roboto Regular",
                     fontWeight: FontWeight.w600),
               ),
             SizedBox(width: 80),
               Radio(
                 value: 2,
                 groupValue: controller.value_.value,
                 onChanged: (value) {
                   controller.ActionRadio(value!);
                 },
               ),
               const Text(
                 'Nữ',
                 style: TextStyle(
                     color: AppColors.placeHolderColor,
                     fontSize: 16,
                     fontFamily: "Roboto Regular",
                     fontWeight: FontWeight.w600),
               ),
           ],
         ),),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: RichText(
                text: TextSpan(
                  text: "Email",
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
                expands: true,
                maxLines: null,
                controller: controller.textController2,
                decoration: InputDecoration(
                  
                  hintText:
                      "Nhập email",
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
                  text: "Số điện thoại",
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
                expands: true,
                maxLines: null,
                controller: controller.textController3,
                decoration: InputDecoration(
                  hintText:
                      "VD: 09xxxxxxxxx",
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
                  text: "Địa chỉ",
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
                expands: true,
                maxLines: null,
                controller: controller.textController4,
                decoration: InputDecoration(
                  hintText:
                      "Địa chỉ hiện tại của bạn",
                  hintStyle: TextStyle(
                      color: AppColors.placeHolderColor,
                      fontSize: 14,
                      overflow: TextOverflow.visible),
                  border: InputBorder.none
                 ),
                ),
               ), 
                SizedBox(height: 100,)
              ]
            )
          )
         );
        
  }
}