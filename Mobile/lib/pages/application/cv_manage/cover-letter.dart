import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/application/cv_manage/cv_manage_controller.dart';
import '../../../common/colors/colors.dart';

class CoverLetter extends GetView<CVManageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/cl_logo.png',
                width: 200,
                height: 200,
              ),
              Text(
                "Tạo Cover letter đầu tiên trên TopCV",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16
                ),
              ),
              SizedBox(height: 8,),
              Text(
                "Hãy tạo ngay Cover letter đồng bộ với CV trên TopCV để có được ấn tượng sâu sắc đầu tiên từ nhà tuyển dụng",
                style: TextStyle(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 40),
                  backgroundColor: AppColors.primaryColor1,
                  foregroundColor: Colors.white,
                  elevation: 2,
                ),
                onPressed: () => {}, 
                child: Text("Tạo Cover letter ngay")
              )
            ],
          ),
        ),
      ),
    );
  }
}