import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/candidate/suitablejob/suitablejob_controller.dart';
import 'package:jobpilot_app/share/jobmain_item.dart';

class SuitablePage extends GetView<SuitableController> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/tcv.webp')
              
              )
          ),
        ),
        title: Text(
          'Gợi ý việc làm phù hợp',
            style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, index) {
            return   JobMainItem(
             context,
             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6XvpvndsBxz91yLchUbmiHEGFl9r7XOY2dswC1bLikQ&s',
             'Công Ty Công Nghệ Viên Thông Viettel',
             'Tuyển Lập trình Viên Cyber Sercurity',
             'Hà Nội',
             '2 năm',
             '20-25 triệu',
             false
            );
          },
        ),
      ),
     );
  }
}
