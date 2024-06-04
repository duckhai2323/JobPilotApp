import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/agent/employee/employee_controller.dart';
import 'package:jobpilot_app/pages/agent/employee/item_employee.dart';

import '../../../common/colors/colors.dart';

class EmployeePage extends GetView<EmployeeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
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
            const SizedBox(width: 10,height: 10,),
            const Text(
              'Employee',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.primaryColor1,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primaryColor1
              ),
              child: Icon(Icons.add,color: Colors.white,size: 20,),
            ),
          ],
        ),
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: Obx(()=>ListView.builder(
          padding: const EdgeInsets.only(top: 15),
          itemCount: controller.employees.length,
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(onTap:(){},child: ItemEmployee(controller.employees[index].agent_name, controller.employees[index].agent_image??"", controller.employees[index].agent_email, controller.employees[index].status));
          },
        ),),
      ),
    );
  }
}