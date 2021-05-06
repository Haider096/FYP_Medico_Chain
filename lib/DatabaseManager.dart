import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
  // ignore: deprecated_member_use
  Firestore.instance.collection('mediInfo');

  Future<void> createUserData(
      String symptoms, String infection, String bloodpressure, String uid) async {
    return await profileList
        // ignore: deprecated_member_use
        .document(uid)
        // ignore: deprecated_member_use
        .setData({'symptoms': symptoms, 'infection': infection, 'bloodpressure':bloodpressure});
  }}

  // Future updateUserList( String symptoms, String infection, int bloodpressure, String uid) async {
  //   // ignore: deprecated_member_use
  //   return await profileList.document(uid).updateData({
  //     'symptoms': symptoms, 'infection': infection, 'bloodpressure':bloodpressure
  //   });}}
