import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/pages/agent/employee/employee_controller.dart';

import '../../../common/colors/colors.dart';

class  ItemEmployee extends GetView<EmployeeController> {
  final String agent_name;
  final String agent_image;
  final String agent_email;
  final int status;

  ItemEmployee(this.agent_name, this.agent_image, this.agent_email, this.status);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      margin: const EdgeInsets.only(bottom: 12,left: 15,right: 15),
      padding: const EdgeInsets.only(bottom: 15,top: 15,left: 15,right: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(agent_image),
          ),
          Container(
            width: MediaQuery.of(context).size.width-135,
            height: 140,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  agent_name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  agent_email,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),

                const SizedBox(height: 15,),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 5),
                  decoration: BoxDecoration(
                    color: status==1?AppColors.primaryColor1:AppColors.bgSearch,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status==1?'Đang hoạt động':'Không hoạt động',
                    style: TextStyle(
                      fontSize: 14,
                      color: status==1?Colors.white:Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}