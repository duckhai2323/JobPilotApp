import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/notification/notification_controller.dart';

import '../../common/colors/colors.dart';

class NotificationPage extends GetView<NotificationController> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
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
              'Thông báo',
              style: TextStyle(
                fontSize: 18,
                color:  AppColors.primaryColor1,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
      body: Obx(
        ()=> ListView.builder(
          itemCount: controller.listNotifi.isNotEmpty?controller.listNotifi.length:0,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return NotificationItem(
                icon: Icons.notifications,
                title: controller.listNotifi[index].company_name,
                description: controller.listNotifi[index].description
            );
          },
        ),
      )
    );
  }
}
class NotificationItem extends GetView<NotificationController> {
  final IconData icon;
  final String title;
  final String description;

  NotificationItem({
    required this.icon,
    required this.title,
    required this.description,
  });
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,color: AppColors.primaryColor1,),
      title: Text(title,style: TextStyle(color: AppColors.primaryColor1),),
      subtitle: Text(description),
      onTap: () {
        Get.back();
        controller.applicationController.jumToPageJobFair();
      },
    );
  }
}