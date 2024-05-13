import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/agent/edit_job/edit_job_controller.dart';
import 'package:jobpilot_app/pages/agent/edit_job/form_edit_interview.dart';
import 'package:jobpilot_app/share/form_add_job.dart';

import '../../../common/colors/colors.dart';
import '../../../share/form_large_edit.dart';

class EditJobPage extends GetView<EditJobController> {

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
              'Chỉnh sửa việc làm',
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
              FormAddJob('Nội dung công việc', 'Lập trình viên Flutter',controller.textController1,false),
              const SizedBox(height: 10,),
              FormAddJob('Mức lương', '20M',controller.textController2,false),
              const SizedBox(height: 10,),
              FormAddJob('Địa điểm', 'Hà Nội',controller.textController3,false),
              const SizedBox(height: 10,),
              FormAddJob('Kinh nghiệm', '2 năm',controller.textController4,false),
              const SizedBox(height: 10,),
              FormLargeEdit('Mô tả công việc', 'Sử dụng Frameword Flutter phát triển...',controller.textController5),
              const SizedBox(height: 10,),
              FormLargeEdit('Yêu cầu ứng viên', 'Kỹ năng chuyên môn,...',controller.textController6),
              const SizedBox(height: 10,),
              FormLargeEdit('Quyền lợi', 'Hỗ trợ bảo hiểm,...',controller.textController7),
              const SizedBox(height: 10,),
              FormAddJob('Hình thức làm việc', 'Offline',controller.textController8,false),
              const SizedBox(height: 10,),
              FormAddJob('Số người dự tuyển', '5',controller.textController9,false),
              const SizedBox(height: 10,),
              InkWell(onTap: (){controller.showDialogTime(context, 0,'deadline', controller.textController10.text??'20/5/2024');},child: FormAddJob('Hạn nộp', '20/5/2024',controller.textController10,true)),

              const SizedBox(height: 15,),
              const Text(
                'Thời gian phỏng vấn - Test',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor1
                ),
              ),

              Obx(() => ListView.builder(
                itemCount: controller.listInterview.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        FormEditInterview(index,'Vòng ${index+1} - Hình thức kiểm tra', 'Phỏng vấn vòng ${index+1} (Test IQ)',controller.listInterview[index].textEditingController),
                      ],
                    ),
                  );
                },
              ),),

              const SizedBox(height: 30,),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      controller.addInterView();
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
                          'Thêm',
                          style: TextStyle(
                            fontSize: 18,
                            color:  Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20,),

                  InkWell(
                    onTap: (){
                      controller.updateJobDetail(context);
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