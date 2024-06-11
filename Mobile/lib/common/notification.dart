import 'package:cloud_firestore/cloud_firestore.dart';

class Notification1 {
  final String company_name;
  final String description;
  final String candidate_email;
  final bool read ;

  Notification1(
      this.company_name,
      this.description,
      this.candidate_email,
      this.read,
      );

  factory Notification1.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options){
    final json = snapshot.data();
    return Notification1(
      json?['company_name']??"",
      json?['description']??"",
      json?['candidate_email']??"",
      json?['read'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'company_name' : company_name,
      'description' : description,
      'candidate_email': candidate_email,
      'read' : read,
    };
  }
}