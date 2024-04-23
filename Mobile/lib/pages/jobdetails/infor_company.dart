import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/pages/application/home/jobmain_item.dart';
import 'package:jobpilot_app/pages/jobdetails/jobdetails_controller.dart';

class InforCompany extends GetView<JobDetailsController> {
  const InforCompany({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget> [
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text(
                  "    Công ty cổ phần Sun Asterisk",
                  style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.location_city),
                    iconColor: AppColors.primaryColor1,
                    title: Text(
                      'Địa chỉ công ty',
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 10,
                        color: AppColors.placeHolderColor
                      ),
                      ),
                    subtitle: Text('Tòa Keangnam Mỹ Đình, Hà Nội'),
                  ),
                ListTile(
                    leading: Icon(Icons.stars),
                    iconColor: AppColors.primaryColor1,
                    title: Text(
                      'Website công ty',
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 10,
                        color: AppColors.placeHolderColor
                      ),
                      ),
                    subtitle: Text('https://sun-asterisk.vn/'),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "    Giới thiệu công ty",
                    style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "    Việc làm cùng công ty",
                    style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                  ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return InkWell(onTap: () {controller.HandleJobdetails();},child: JobMainItem());
              },
            childCount: 3,
            ),
          )
        ],
      ),
    );
  }
}