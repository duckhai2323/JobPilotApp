import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/agent/edit_company_infor/edit_company_controller.dart';
import 'package:jobpilot_app/share/form_edit.dart';
import 'package:jobpilot_app/share/form_large_edit.dart';

class EditCompanyPage extends GetView<EditCompanyController> {

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
              'Chỉnh sửa',
              style: TextStyle(
                fontSize: 20,
                color:  AppColors.primaryColor1,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'Reset',
              style: TextStyle(
                fontSize: 18,
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                children: [
                  Icon(Icons.mode_edit_outlined,color: AppColors.primaryColor1,size: 25,),
                  SizedBox(width: 5,),
                  Text(
                    'Vui long dien thong tin phu hop',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor1
                    )
                  ),
                ],
              ),
              const SizedBox(height: 3,),
              const Divider(),
              const SizedBox(height: 5,),
              FormEdit('Tên công ty', 'abc', Icon(Icons.business,size: 25,color: AppColors.primaryColor1,)),
              const SizedBox(height: 10,),
              FormEdit('Website', 'abc', Icon(CupertinoIcons.globe,size: 25,color: AppColors.primaryColor1,)),
              const SizedBox(height: 10,),
              FormEdit('Quy mô', 'abc', Icon(Icons.auto_awesome_outlined,size: 25,color: AppColors.primaryColor1,)),
              const SizedBox(height: 10,),
              FormEdit('Địa chỉ', 'abc', Icon(Icons.location_on_outlined,size: 25,color: AppColors.primaryColor1,)),
              const SizedBox(height: 10,),
              FormEdit('Năm thành lập', 'abc', Icon(Icons.calendar_month_outlined,size: 25,color: AppColors.primaryColor1,)),
              const SizedBox(height: 10,),
              FormEdit('Lĩnh vực phát triển', 'abc', Icon(Icons.auto_graph,size: 25,color: AppColors.primaryColor1,)),
              const SizedBox(height: 10,),
              FormLargeEdit('Giới thiệu công ty', 'abc'),
              const SizedBox(height: 30,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*1/3,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor1,
                    borderRadius: BorderRadius.circular(4),
                  ),

                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                        color:  Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}