import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/application/profile/profile_controller.dart';

import '../../../common/colors/colors.dart';

class ProfileInfor extends GetView<ProfileController> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 180,
          color: AppColors.primaryColor3,
        ),
        Positioned(
          top: 100,
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 50,
          left: 15,
          right: 15,
          child: Container(
            height: 115,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.25,
                    blurRadius: 2,
                    offset: Offset(0,2),
                  )
                ]
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.primaryColor1,
                      child:Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.white, // Màu của viền
                              width: 3, // Độ dày của viền
                            ),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('https://yt3.googleusercontent.com/v-fHSvLthvdRlrtXeEbWc1JtuKPa7yUeG668kRdxbX6XAxcw_rlhf8wjRGxht_oepo49SkwnXA=s900-c-k-c0x00ffffff-no-rj'),
                            ),
                          ),
                        ),
                      ) ,
                    ),
                    const Positioned(
                      right: 5,
                      bottom: 2,
                      child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.camera_alt)
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  width: 15,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Khai Tran Duc',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    RichText(
                      text: const TextSpan(
                        text: 'Mã ứng viên: ',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.placeHolderColor,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: '21020340', style: TextStyle(color: Colors.black,)),
                        ],
                      ),
                    ),

                    Container(
                      height: 25,
                      width: 175,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.arrow_up_circle_fill, size: 18, color: Colors.black,),
                          SizedBox(width: 8,),
                          Text(
                            'Nâng cấp tài khoản',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}