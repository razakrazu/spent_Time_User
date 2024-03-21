import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthenticationController extends GetxController {

TextEditingController passwordController= TextEditingController();
TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    user.bindStream(_auth.authStateChanges());
    super.onInit();
  }                   
   Future<void> signUp({
    required String userName,
    required String email,   
    required String password,

  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
        
      );

      if (userCredential.user != null) {


      String userId = userCredential.user!.uid;

       SharedPreferences getuserId =  await SharedPreferences.getInstance();
        getuserId.setString('getuser_id', userId);

      
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'userId': userId,
        'userName': userName,
        'email': email,      
        'password':password,
      });
      }
      user.value = userCredential.user;
    } catch (e) {
      print("Error in sign up: $e");
      
    

    }
  }
  Future<String?> signIn({
  required String email,
  required String password,
}) async {
  try {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return null;
  } catch (e) {
   
    return "Sign in failed. Please check your credentials."; 
  }
}

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      user.value = null;
    } catch (e) {
      print("Error in sign out: $e");
     
      throw e;
    }
  }
}
