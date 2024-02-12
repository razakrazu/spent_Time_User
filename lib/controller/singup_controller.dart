import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/model/singup_model.dart';

class SingupData extends GetxController{
  SingupData get instance  => Get.find();

 TextEditingController username = TextEditingController();
 TextEditingController email = TextEditingController();
 TextEditingController password = TextEditingController();

var userlist =RxList<SingupData>();
final dataBase = FirebaseAuth.instance;
final userStorage = FirebaseStorage.instance; 

 Future<bool>addUser(SingupModel usermodel) async {
  Map<String,dynamic>?userDataModel =  {
    'username':username,
    'email':email,
    'password':password,
  
  };
  try{
    await FirebaseFirestore.instance
    .collection('userDatas')
    .doc()
    .set(userDataModel);
    return true;
  }catch(e){
    return false;
  }
 }
}