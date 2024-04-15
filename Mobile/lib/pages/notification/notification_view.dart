import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/notification/notification_controller.dart';

class NotificationPage extends GetView<NotificationController> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text('Thông Báo'),
      ),
      body: ListView(
        children: [
          NotificationItem(
            icon: Icons.notifications, 
            title: 'Công Ty Công Nghệ Viễn Thông - Tập Đoàn Viettel', 
            description: 'Congratulation!'
            ),
          NotificationItem(
            icon: Icons.notifications, 
            title: 'Tập đoàn VNG', 
            description: 'Congratulation!'
            )
        ],
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
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(description),
      onTap: () {
        // Xử lý khi người dùng nhấn vào một thông báo
      },
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
