import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/suitablejob/suitablejob_controller.dart';
import 'package:jobpilot_app/share/jobmain_item.dart';

import '../../common/colors/colors.dart';

class SuitablePage extends GetView<SuitableController> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(	27, 74, 67,1),Color.fromRGBO(45, 93, 71,1)],
                  transform: GradientRotation(-pi/2)
              )
          ),
        ),
        leading: const Icon(Icons.arrow_back,size: 25,color: Colors.white,),
        title: const Text(
          'Gợi ý việc làm phù hợp',
            style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 20),
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
     );
  }
}
