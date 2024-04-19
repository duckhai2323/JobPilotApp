import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'chat_controller.dart';
import 'chat_left_item.dart';
import 'chat_right_item.dart';

class ChatList extends GetView<ChatController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 80),
      child: CustomScrollView(
        //controller: controller.msgScrolling,
        reverse: true,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 40,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index){
                      var intValue = Random().nextInt(10);
                  if(intValue%2 ==0){
                    return ChatRightItem('I Love Wonheee');
                  }else {
                    return ChatLeftItem('I Love You Tooo','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZq66WVks16lIeCywf8KVHzY0qhIssigwvBACI9Xnxi3qjKtBwiEipejNi7sbg-8cxe8o&usqp=CAU');
                  }
                },
                childCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}