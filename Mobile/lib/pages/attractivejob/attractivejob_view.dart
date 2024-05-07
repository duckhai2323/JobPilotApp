import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/attractivejob/attractivejob_controller.dart';
import 'package:jobpilot_app/share/jobsub_item.dart';

import '../../common/colors/colors.dart';

class AttractiveJobPage extends GetView<AttractiveJobController> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        bottom:PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 10),
                margin: const EdgeInsets.only(left: 15,right: 15),
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.search,size: 30,color: AppColors.textSeach,),
                    SizedBox(width: 5,),
                    Text(
                      'Địa điểm - Công ty - Vị trí - Ngành nghề',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSeach
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: 65,
                    height: 35,
                    //padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1,
                          color: AppColors.backgroundColor
                        )
                      )
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.filter_list,size: 25,),
                        SizedBox(width: 5,),
                        Text(
                          'Loc',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
            ],
          )
        ),
        flexibleSpace:  Container(
          margin: const EdgeInsets.only(top: 135),
          padding: const EdgeInsets.only(left: 80,right: 15),
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            shrinkWrap: true,
            //physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context,int index) {
              return Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(left: 15,top: 5,bottom: 5,right: 13),
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: AppColors.textSeach,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Khu vực',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Transform.rotate(
                      angle: pi/2,
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                        color: AppColors.textSeach,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Việc làm hấp dẫn',
            style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: 5,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index) {
          return JobSubItem(
            "https://wsm.sun-asterisk.vn/assets/logo_framgia-58c446c37727ba4bc8317121c321edd3d4ed081787fac85cb08240dcef9dd062.png",
            "Cty Phat Trien Phan Mem Sun Asterisk",
            'Tuyen Lap Trinh Vien Fresher WEB MOBILE',
            'Ha Noi',
            '1 nam',
            '300s',
          );
        },
      ),
    );
  }
}