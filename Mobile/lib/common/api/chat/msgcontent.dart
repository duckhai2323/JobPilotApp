import 'package:cloud_firestore/cloud_firestore.dart';

class Msgcontent {
  final String? uemail;
  final String? content;
  final String? type;
  final Timestamp? addtime;

  Msgcontent({this.uemail, this.content, this.type, this.addtime});

  factory Msgcontent.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options
      ){
    final data = snapshot.data();
    return Msgcontent(
        uemail: data?['uemail'],
        content: data?['content'],
        type: data?['type'],
        addtime: data?['addtime']
    );
  }

  Map<String,dynamic> toFirestore(){
    return {
      if(uemail!=null) "uemail":uemail,
      if(content!=null) "content":content,
      if(type!=null) "type":type,
      if(addtime!=null) "addtime":addtime
    };
  }
}
