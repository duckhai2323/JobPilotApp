import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/routes/names.dart';
import 'package:jobpilot_app/pages/application/application_controller.dart';

import '../../../common/api/chat/msg.dart';

class MessageController extends GetxController {
  final db = FirebaseFirestore.instance;
  final listUser = <ItemChatObject>[].obs;
  var listener;

  @override
  onInit(){
    super.onInit();
    GetDataMessage();
  }

  Future<void> GetDataMessage() async{
    var messData = await db.collection("message").withConverter(
        fromFirestore: Msg.fromFirestore,
        toFirestore: (Msg msg, options) => msg.toFirestore()
    ).orderBy("last_time",descending: false);
    listUser.clear();
    listener = messData.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              if(change.doc.data()?.from_email == ApplicationController.user_email){
                listUser.insert(0,ItemChatObject(change.doc.id,change.doc.data()?.to_avatar??"", change.doc.data()?.to_name??"", change.doc.data()?.to_email??"",change.doc.data()?.last_msg??""));
              } else if(change.doc.data()?.to_email == ApplicationController.user_email) {
                listUser.insert(0,ItemChatObject(change.doc.id,change.doc.data()?.from_avatar??"", change.doc.data()?.from_name??"",change.doc.data()?.to_email??"", change.doc.data()?.last_msg??""));
              }
            }
            break;
          case DocumentChangeType.modified:
            if(change.doc.data()!=null) {
              if(change.doc.data()?.from_email == ApplicationController.user_email){
                listUser.removeWhere((element) => element.doc_id == change.doc.id);
                listUser.insert(0,ItemChatObject(change.doc.id,change.doc.data()?.to_avatar??"", change.doc.data()?.to_name??"", change.doc.data()?.to_email??"",change.doc.data()?.last_msg??""));
              } else if(change.doc.data()?.to_email == ApplicationController.user_email) {
                listUser.removeWhere((element) => element.doc_id == change.doc.id);
                listUser.insert(0,ItemChatObject(change.doc.id,change.doc.data()?.from_avatar??"", change.doc.data()?.from_name??"",change.doc.data()?.to_email??"", change.doc.data()?.last_msg??""));
              }
            }
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
  }

  ClickItemChat(ItemChatObject msg) async {
    Get.toNamed(AppRoutes.CHAT,parameters: {"to_uid": msg.user_email??"","to_name":msg.usr_name??"","to_avatar":msg.user_image??"","check_first":"true","doc_id":msg.doc_id??""});
  }

  void HandleChatPage () {
    Get.toNamed(AppRoutes.CHAT);
  }
}

class ItemChatObject{
  String doc_id;
  String user_email;
  String user_image;
  String usr_name;
  String last_chat;

  ItemChatObject(this.doc_id,this.user_image,this.usr_name,this.user_email,this.last_chat);
}
