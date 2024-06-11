import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jobpilot_app/common/notification.dart';

import '../application/application_controller.dart';

class NotificationController extends GetxController{
  final db = FirebaseFirestore.instance;
  var listener;
  List<Notification1> listNotifi = <Notification1>[].obs;
  var newNotifi = 0.obs;

  var applicationController = Get.find<ApplicationController>();


  @override
  void onInit() {
    super.onInit();
    GetData();
  }

  Future<void> GetData() async {
    var data = await db.collection("notifications").withConverter(
        fromFirestore: Notification1.fromFirestore,
        toFirestore: (Notification1 notification1, options) =>
            notification1.toFirestore()
    ).where('candidate_email', isEqualTo: ApplicationController.user_email);
    listNotifi.clear();
    listener = data.snapshots().listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.added:
            if (change.doc.data() != null) {
              if(!change.doc.data()!.read) {
                newNotifi.value = newNotifi.value + 1;
              }
              listNotifi.insert(0, change.doc.data()!);
            }
            break;
          case DocumentChangeType.modified:
            if (change.doc.data() != null) {
              newNotifi.value = 0;
            }
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
  }

  Future<void> updateRead() async {
    var querySnapshot = await db.collection("notifications")
        .withConverter(
      fromFirestore: Notification1.fromFirestore,
      toFirestore: (Notification1 notification1, options) => notification1.toFirestore(),
    )
        .where('candidate_email', isEqualTo: ApplicationController.user_email)
        .get();
    for (var doc in querySnapshot.docs) {
      await doc.reference.update({"read": true});
    }
  }
}
