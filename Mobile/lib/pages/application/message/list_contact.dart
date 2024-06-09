import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';

import 'message_controller.dart';

class ListContact extends GetView<MessageController>{
  Widget ItemUser1 (ItemChatObject itemChatObject){
    return Column(
      children: [
        ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 42,
                backgroundColor: AppColors.primaryColor1,
                child:Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(itemChatObject.user_image),
                    ),
                  ),
                ) ,
              ),
              const Positioned(
                right: 6,
                bottom: 3,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Color(0xFF4CAF50),
                  ),
                ),
              ),
            ],
          ),

          title: Text(
            itemChatObject.usr_name,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),

          subtitle: Text(
            itemChatObject.last_chat,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight:  FontWeight.bold,
            ),
          ),

          trailing: const CircleAvatar(
            radius: 7,
            backgroundColor: AppColors.primaryColor1,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: AppColors.bgTextFeild,
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10,top: 5,bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: Obx(
        ()=>ListView.builder(
          itemCount: controller.listUser.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index){
            return InkWell(
                onTap:(){
                  controller.ClickItemChat(controller.listUser[index]);
                } ,
                child: ItemUser1(controller.listUser[index]));
          },
        ),
      ),
    );
  }
}