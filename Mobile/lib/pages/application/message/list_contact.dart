import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobpilot_app/common/colors/colors.dart';

import 'message_controller.dart';

class ListContact extends GetView<MessageController>{
  Widget ItemUser1 (){
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
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://scontent.fhan14-1.fna.fbcdn.net/v/t39.30808-6/429676880_249901944842691_293763202580111610_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeH60vAWV-kWtMcuQCB2lUQ7ikwEH4IHee-KTAQfggd579lagOCQfl2kw6QtWE7C6UVgf0Ua-7zr9VnRZzNQnqMY&_nc_ohc=TLLAW6gjvjoAb6JXV0U&_nc_ht=scontent.fhan14-1.fna&cb_e2o_trans=t&oh=00_AfCwgrLbMynSGBmuS-J-h3whUt81EDrt8Tq1nX6ppersQw&oe=661C9C94'),
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

          title: const Text(
            "Nguyen Van B",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),

          subtitle: const Text(
            'May da chay task xong chua ha',
            style: TextStyle(
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
        Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: Colors.grey.withOpacity(0.5),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10,top: 5,bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          return InkWell(
              onTap:(){
                //controller.ClickItemChat(controller.listUser[index]);
              } ,
              child: ItemUser1());
        },
      ),
    );
  }
}