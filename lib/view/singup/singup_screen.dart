

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/controller/singup/authentication_repository.dart';
import 'package:speat_time_user/view/widgets/my_text_form_field.dart';






class SingUpScreen extends StatelessWidget {
  //  AuthenticationRepository authController= Get.put(AuthenticationRepository());
AuthenticationController authController= Get.put(AuthenticationController());
   SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( body: SafeArea(
      child: Column(
        children: [
Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextFormField(labal: 'Enter Your Name', icon: Icons.person, controller:authController.username,),
),
Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextFormField(labal: 'Enter Your Email', icon: Icons.mail, controller: authController.email,),
),
Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextFormField(labal: 'Enter Your Password', icon: Icons.lock, controller: authController.password,),
),


// Padding(
//   padding: const EdgeInsets.all(10),
//   child:   Obx(
//     ()=> MyTextButton(  label:  authController.loading.value?CircularProgressIndicator(color: Colors.white,):'SingUp',
//      pressed: () async {
//   await  authController.singUp();
//     },),
//   ),
// ),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  InkWell(
    onTap: () async {
  await  authController.singUp();
    },
    child: SizedBox(

   child: authController.loading.value?CircularProgressIndicator(color: Colors.white,):  Text('submit')
    ),
  )
],)
    ],)),);
  }
}


