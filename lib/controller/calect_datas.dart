import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerDatas extends GetxController{
  
final db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAccepted() {
    final CollectionReference accepted =
        FirebaseFirestore.instance.collection('approvedRooms');
    final acceptStream = accepted.snapshots();
    return acceptStream;
  }

  Future<List<String>> fetchProfileImageUrls() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await db.collection('approvedRooms').get();

      return snapshot.docs
          .where((document) => document.data().containsKey('profileImage'))
          .map<String>((document) => document['profileImage'] as String)
          .toList();
    } catch (e) {
      Text('Error fetching data: $e');
      return [];
    }
  }

  Stream<QuerySnapshot> getuserDeatils() {
    final CollectionReference accepted =
        FirebaseFirestore.instance.collection('users');
    final acceptStream = accepted.snapshots();
    return acceptStream;
  }

  

  Future getuserdata() async {
    SharedPreferences getuserId = await SharedPreferences.getInstance();

    final userId = getuserId.getString('getuser_id');

    if (userId != null) {
      final DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userData.exists) {
        final Map<String, dynamic> userDataMap =
            userData.data() as Map<String, dynamic>;
        final String username = userDataMap['userName'] ?? '';
        final String phoneNumber = userDataMap['phoneNumber'] ?? '';

      

        return {
          'userId': userId,
          'username': username,
          'phoneNumber': phoneNumber
        };
      } else {
        throw Exception('User document does not exist for user ID: $userId');
      }
    }
  }
}

