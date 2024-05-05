import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/application/candidate/profile/profile_controller.dart';

import '../../../../common/colors/colors.dart';

class ItemGrid extends GetView<ProfileController> {
  Icon icon;
  String itemStr;
  String number;
  ItemGrid(this.icon, this.itemStr, this.number, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2-22,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.bgTextFeild,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: icon,
          ),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 130,
                child: Text(
                  itemStr,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),

              Text(
                number,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}