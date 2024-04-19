import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/pages/chat/chat_controller.dart';

import '../../common/colors/colors.dart';
import 'chat_appbar.dart';
import 'chat_list.dart';

class ChatPage extends GetView<ChatController>{

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            height: 1,
          ),
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor1,
          ),
        ),
        flexibleSpace: ChatAppBar(),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          children: [
            ChatList(),
            Positioned(
              bottom: 5,
              height: 65,
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Màu của đường bóng và độ trong suốt
                      spreadRadius: 2, // Kích thước đường bóng
                      blurRadius: 10, // Độ mờ của đường bóng
                      offset: Offset(0, -3), // Độ dịch chuyển của đường bóng (0,-3 sẽ đẩy lên phía trên)
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: controller.visible.value,
                        child: const Icon(
                          Icons.add_circle,
                          color: AppColors.primaryColor1,
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.visible.value = true;
                        },
                        child: Visibility(
                          visible: !controller.visible.value,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.primaryColor1,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: controller.visible.value,
                          child: const SizedBox(width: 20,)),
                      Visibility(
                        visible: controller.visible.value,
                        child: const Icon(
                          Icons.camera_alt,
                          color:AppColors.primaryColor1,
                          size: 30,
                        ),
                      ),
                      Visibility(
                          visible: controller.visible.value,
                          child: const SizedBox(width: 20,)
                      ),
                      Visibility(
                        visible: controller.visible.value,
                        child: const Icon(
                          Icons.image_rounded,
                          color: AppColors.primaryColor1,
                          size: 30,
                        ),
                      ),
                      Visibility(
                          visible: controller.visible.value,
                          child: const SizedBox(width: 20,)
                      ),
                      Visibility(
                        visible: controller.visible.value,
                        child: const Icon(
                          Icons.mic,
                          color: AppColors.primaryColor1,
                          size: 30,
                        ),
                      ),
                      Visibility(
                          visible: controller.visible.value,
                          child: const SizedBox(width: 20,)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: TextField(
                            controller: controller.messageText,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(top: 5,left: 10),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              suffixIcon: const Icon(Icons.insert_emoticon_rounded,color: AppColors.primaryColor1,size: 25,),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide(color: Colors.grey.shade200,width: 1),
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: const BorderSide(color: AppColors.primaryColor1),
                              ),
                              hintText: 'Aa',
                              hintStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,),
                            ),
                            onTap: (){
                              controller.visible.value = false;
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: (){
                          String str = controller.messageText.text.toString();
                          if(str!=""){
                            //controller.sendMessage(str);
                          }
                          controller.messageText.text = "";
                        },
                        child: const Icon(
                          Icons.send,
                          color: AppColors.primaryColor1,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 15,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}