import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  final CollectionReference profileDatas = FirebaseFirestore.instance.collection('users');
    Stream <QuerySnapshot>getProfileDatas(){
    final bookDataStream = profileDatas.snapshots();

    return bookDataStream;
    
  }

}