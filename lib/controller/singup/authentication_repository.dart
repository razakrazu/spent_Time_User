
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/model/singup_model.dart';
import 'package:speat_time_user/view/bottom_navigation/bottom_navigation.dart';


class AuthenticationController extends GetxController {
// final FirebaseAuth _auth = FirebaseAuth.instance;

//   Rx<User?> user = Rx<User?>(null);

//   @override
//   void onInit() {
//     user.bindStream(_auth.authStateChanges());
//     super.onInit();
//   }

//   Future<void> signUp({
//   required String userName,
//   required String email,
//   required String password,
// }) async {
//   try {
//     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     if (userCredential.user != null) {
//       String userId = userCredential.user!.uid;

//       SharedPreferences getuserId = await SharedPreferences.getInstance();
//       getuserId.setString('getuser_id', userId);

//       await FirebaseFirestore.instance.collection('users').doc(userId).set({
//         'userId': userId,
//         'userName': userName,
//         'email': email,
//         'password': password,
//       });
//     }

//     user.value = userCredential.user;
//   } catch (e) {
//     print("Error in sign up: $e");
//     throw e;
//   }
// }



//   Future<String?> signIn({
//   required String email,
//   required String password,
// }) async {
//   try {
//     await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     return null;
//   } catch (e) {
   
//     return "Sign in failed. Please check your credentials."; 
//   }
// }

//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//       user.value = null;
//     } catch (e) {
//       print("Error in sign out: $e");
     
//       throw e;
//     }
//   }

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore dB = FirebaseFirestore.instance;

final TextEditingController username = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController loginpassword = TextEditingController();
final TextEditingController loginemail = TextEditingController();
final TextEditingController restemail = TextEditingController();
 var loading = false.obs;



//  create account with email and password 

singUp()async{
  try{
    loading.value =true;
    await auth.createUserWithEmailAndPassword(email:email.text,password:password.text);
  await singUp();
  Get.to(BottomNavigation());
  loading.value =  false; 
  }catch(e){
Get.snackbar('error', '$e');
loading.value =false;
  }
}



addUser()async{
SingupModel user= SingupModel(
  name: username.text,
 mail: email.text, 
 password: password.text, 
//  userId: document.id
  );
  await dB.collection('users')
  .doc(auth.currentUser?.uid)
  .collection('profile')
  .add(user.toMap());
}
singOut() async{
  await auth.signOut();
}

singIn()async{
  try{

      await auth.signInWithEmailAndPassword(email: loginemail.text, password: loginpassword.text);

  }catch(e){
Get.snackbar('error', '$e');
  }
}
}
