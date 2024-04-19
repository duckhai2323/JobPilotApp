import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../common/colors/colors.dart';
import 'chat_controller.dart';

class ChatAppBar extends GetView<ChatController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50, top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundImage: CachedNetworkImageProvider('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZq66WVks16lIeCywf8KVHzY0qhIssigwvBACI9Xnxi3qjKtBwiEipejNi7sbg-8cxe8o&usqp=CAU'),
              ),

              SizedBox(width: 15,),

              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tuan Tien Ty',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      'Đang hoạt động',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(Icons.menu,color: AppColors.primaryColor1,size: 30,),
          ),
        ],
      ),
    );
  }
}