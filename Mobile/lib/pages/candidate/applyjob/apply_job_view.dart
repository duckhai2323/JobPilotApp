import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';

import 'apply_job_controller.dart';

class ApplyJobPage extends GetView<ApplyJobController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomSheet: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 0.25,
                blurRadius: 3,
                offset: Offset(0,2),
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){},
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width-50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primaryColor1,
                ),
                child: const Center(
                  child: Text(
                    'Ứng tuyển',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          title: Padding(
        padding: EdgeInsets.only(left: 90),
        child: Text(
          "Ứng tuyển",
          style: TextStyle(
              fontFamily: "Roboto", fontWeight: FontWeight.w600, fontSize: 20),
        ),
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Thư giới thiệu",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                  hintText:
                      "Viết giới thiệu ngắn gọn về bản thân (điểm mạnh,điểm yếu) và nêu rõ mong muốn, lý do làm việc tại công ty này",
                  hintStyle: TextStyle(
                      color: AppColors.placeHolderColor,
                      fontSize: 14,
                      overflow: TextOverflow.visible),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.placeHolderColor,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 20, bottom: 10),
              child: Text(
                "Lưu ý",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "1.  ",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        color: Colors.black
                      ),  
                    ),
                  ),
                  Container(
                     
                    //padding: EdgeInsets.only(top: 3),
                    child: Expanded(
                      child: RichText(
                        textAlign: TextAlign.justify,
                        maxLines: 10, // Số dòng tối đa cần hiển thị
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: "JobPilot khuyên tất cả các bạn hãy luôn cẩn trọng trong quá trình tìm việc và chủ động nghiên cứu về thông tin công ty, vị trí việc làm trước khi ứng tuyển. Ứng viên cần có trách nghiệm với hành vi ứng tuyển của mình. Nếu bạn gặp phải tin tuyển dụng hoặc nhận được liên lạc đáng ngờ của nhà tuyển dụng, hãy báo cáo ngay cho JobPilot qua email hỗ trợ ",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontFamily: "Roboto",
                            
                          ),
                          children: [
                            TextSpan(
                              text: 'hotro@jobpilot.com',
                              style: TextStyle(color: AppColors.primaryColor1,decoration: TextDecoration.underline,),
                            ),
                            TextSpan(
                              text: ' để được hỗ trợ kịp thời',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "2.  ",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        color: Colors.black
                      ),  
                    ),
                  ),
                  
                  Container(
                    child: Expanded(
                      child: RichText(
                        textAlign: TextAlign.justify,
                        maxLines: 10, // Số dòng tối đa cần hiển thị
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: "Tìm hiểu thêm kinh nghiệm phòng tránh lừa đảo",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontFamily: "Roboto",
                            
                          ),
                          children: [
                            TextSpan(
                              text: ' tại đây',
                              style: TextStyle(color: AppColors.primaryColor1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
