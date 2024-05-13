import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/edit_job/edit_job_controller.dart';

import '../../../common/colors/colors.dart';
class FormEditInterview extends GetView<EditJobController> {
  final int index;
  final String title;
  final String subTitle;
  final TextEditingController textController;
  const FormEditInterview(this.index,this.title, this.subTitle, this.textController, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            Visibility(
              visible: index==0?false:true,
              child: InkWell(
                onTap: (){
                  controller.cancelInterview(index);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primaryColor1
                  ),
                  child: const Icon(CupertinoIcons.minus,color: Colors.white,size: 20,),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10,),

        TextFormField(
          obscureText: false,
          controller: textController,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.primaryColor2
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            filled: true,
            fillColor: Colors.white,
            hintText: subTitle,
            hintStyle: const TextStyle(color: AppColors.placeHolderColor,fontSize: 16,fontFamily: "Roboto Regular", fontWeight: FontWeight.w500),
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

        InkWell(
          onTap: (){
            controller.showDialogTime(context,index,'interview', controller.listInterview[index].testDate == 'Chọn ngày/tháng/năm'?'20/5/2024':controller.listInterview[index].testDate);
          },
          child: Obx(()=>Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1
                ),
                color: Colors.white
            ),
            child: Text(
              controller.listInterview[index].testDate,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: controller.listInterview[index].testDate == 'Chọn ngày/tháng/năm'?AppColors.placeHolderColor:Colors.black
              ),
            ),
          ),),
        ),
      ],
    );
  }
}