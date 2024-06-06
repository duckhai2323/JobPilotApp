import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/agent/add_employee/add_employee_controller.dart';
import 'package:jobpilot_app/share/form_add_job.dart';

import '../../../common/colors/colors.dart';

class AddEmployeePage extends GetView<AddEmployeeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 55,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            height: 1,
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 23,
                  color: AppColors.primaryColor1,
                  onPressed: (){

                  },
                ),
              ],
            ),
            const Text(
              'Thêm Nhân Viên',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.primaryColor1,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'Reset',
              style: TextStyle(
                fontSize: 16,
                color:  AppColors.primaryColor1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                children: [
                  Icon(Icons.mode_edit_outlined,color: AppColors.primaryColor1,size: 25,),
                  SizedBox(width: 5,),
                  Text(
                      'Vui lòng điền thông tin thích hợp',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor1
                      )
                  ),
                ],
              ),

              const SizedBox(height: 10,),
              FormAddJob('Tên nhân viên', 'Trần Đức Khải',controller.textController1,false),
              const SizedBox(height: 10,),
              FormAddJob('Địa chỉ email', 'agent1.1@gmail.com',controller.textController2,false),
              const SizedBox(height: 10,),
              Obx(() => Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mật khẩu',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 5,),

                  TextFormField(
                    obscureText: controller.obscureText1_.value,
                    controller: controller.textController3,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.primaryColor2
                    ),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Mật khẩu',
                        hintStyle: const TextStyle(color: AppColors.placeHolderColor,fontSize: 16,fontFamily: "Roboto Regular", fontWeight: FontWeight.w500),
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.ClickVisible1();
                          },
                          child: Icon(
                            controller.obscureText1_.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                            color: Colors.grey,
                            size: 23,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:  BorderSide(
                                color: Colors.grey.shade400,
                                width: 1
                            )
                        ),

                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:  BorderSide(
                                color: Colors.grey.shade400,
                                width: 1
                            )
                        ),
                      ),
                    ),
                  ],
                )),
              const SizedBox(height: 10,),
              Obx(() => Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nhập lại mật khẩu',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 5,),

                  TextFormField(
                    obscureText: controller.obscureText2_.value,
                    controller: controller.textController4,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.primaryColor2
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Nhập lại mật khẩu',
                      hintStyle: const TextStyle(color: AppColors.placeHolderColor,fontSize: 16,fontFamily: "Roboto Regular", fontWeight: FontWeight.w500),
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.ClickVisible2();
                        },
                        child: Icon(
                          controller.obscureText2_.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                          size: 23,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:  BorderSide(
                              color: Colors.grey.shade400,
                              width: 1
                          )
                      ),

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:  BorderSide(
                              color: Colors.grey.shade400,
                              width: 1
                          )
                      ),
                    ),
                  ),
                ],
              )),


              const SizedBox(height: 30,),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  InkWell(
                    onTap: (){
                      controller.addEmployee(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*1/3,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor1,
                        borderRadius: BorderRadius.circular(4),
                      ),

                      child: const Center(
                        child: Text(
                          'Lưu',
                          style: TextStyle(
                            fontSize: 18,
                            color:  Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}