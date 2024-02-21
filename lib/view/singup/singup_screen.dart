import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/controller/singup/authentication_repository.dart';
import 'package:speat_time_user/view/bottom_navigation/bottom_navigation.dart';
import 'package:speat_time_user/view/home_screen/home_screen.dart';
import 'package:speat_time_user/view/widgets/my_text_form_field.dart';
final TextEditingController username = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController loginpassword = TextEditingController();
final TextEditingController loginemail = TextEditingController();
final TextEditingController restemail = TextEditingController();
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
  child:   MyTextFormField(labal: 'Enter Your Name', 
  icon: Icons.person, controller:username,),
),
Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextFormField(labal: 'Enter Your Email',
   icon: Icons.mail, controller: email,),
),
Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextFormField(labal: 'Enter Your Password', icon: Icons.lock, 
  controller:password,),
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
  await  authController.signUp(
                        userName:username.text,
                        email: email.text,
                        password: password.text,
                      );

                      if (authController.user.value != null) {
                        print('created new account');
                        Get.to(BottomNavigation());
                      }
    },
    child: SizedBox(

   child: 
  //  authController.loading.value?CircularProgressIndicator(color: Colors.white,):  
   Text('submit')
    ),
  )
],)
    ],)),);
  }
}


