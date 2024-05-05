import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/application/candidate/profile/profile_controller.dart';

import '../../../../common/colors/colors.dart';

class ItemSetting extends GetView<ProfileController> {
   Icon? icon;
   String? itemStr;
   ItemSetting(this.icon,this.itemStr, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 55,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.bgTextFeild,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon??const Icon(Icons.stars_outlined,size: 30,color: AppColors.placeHolderColor,),
              SizedBox(width: 15),
              Text(
                itemStr??'Nâng cấp tài khoản VIP',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),

          const Icon(Icons.arrow_forward_ios,color: AppColors.placeHolderColor,size: 20,)
        ],
      ),
    );
  }
}