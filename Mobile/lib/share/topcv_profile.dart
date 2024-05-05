import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:jobpilot_app/common/colors/colors.dart';
import 'package:jobpilot_app/common/routes/names.dart';

Widget TopCVProfile(BuildContext context, String image, String name, String date) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 150,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.CVPROFILE);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              color: Colors.blueGrey[700],
            ),
            width: MediaQuery.of(context).size.width,
            height: 110,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        child: image != "" ? Image.asset("") : Container(),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.stars_rounded,
                    size: 35,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          )
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Color.fromARGB(255, 218, 216, 216)),
              bottom: BorderSide(color: Color.fromARGB(255, 218, 216, 216)),
              right: BorderSide(color: Color.fromARGB(255, 218, 216, 216)),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey,
              )
            ],
          ),
        )
      ],
    ),
  );
}
