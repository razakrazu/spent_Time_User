import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/controller/singup/authentication_repository.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/home_screen/home_screen.dart';
import 'package:speat_time_user/view/widgets/button.dart';
import 'package:speat_time_user/view/widgets/my_text_form_field.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';
final TextEditingController username = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController loginpassword = TextEditingController();
final TextEditingController loginemail = TextEditingController();
final TextEditingController restemail = TextEditingController();
class SingUpScreen extends StatelessWidget {
AuthenticationController authController= Get.put(AuthenticationController());
   SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( body: SafeArea(
      child: Stack(
        children: [
        const   Image(image: AssetImage('lib/assets/roberto-nickson-so3wgJLwDxo-unsplash.jpg'),fit: BoxFit.cover,
          width:  double.infinity,
          height: double.infinity,
        ),
          Padding(
            padding: const EdgeInsets.only(top: 190),
            child: Container(
              
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  
                ),
                color: Colors.white
              ),
              child: Column(
              
                children: [
                  height50,
          const        MyTextWidgets(title: 'Get Started', fontsize: 30, fontwidget: FontWeight.bold, fontcolor: blackColor),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
              child:   MyTextFormField(labal: 'Enter Your Name', 
              icon: Icons.person, controller:username,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 25),
              child:   MyTextFormField(labal: 'Enter Your Email',
               icon: Icons.mail, controller: email,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 25),
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
          
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 45),
              child: SingupButton(
               text: 'Sing up',
               titlesize: 22,
               fontcolor: blackColor,
               fontwidget: FontWeight.w600,
               backgroundcolor: const Color.fromARGB(255, 153, 209, 255),
               
               onaction: () async {
                      await  authController.signUp(
                              userName:username.text,
                              email: email.text,
                              password: password.text,
                            );
                    
                            if (authController.user.value != null) {
                              print('created new account');
                              Get.to(HomeScreen());
                            }
              },
               buttonhight:50,
            
               ),
            ),
            height20,
            Row(
        
              children: [
                Expanded(
                  child: Divider(
                    color:  Colors.grey.withOpacity(0.5),
                    thickness: 0.8,
                       indent: 15,
                       endIndent: 10,     
                  ),
                ),
         const       MyTextWidgets(title: 'Sing up with', fontsize: 15, fontwidget: FontWeight.normal, fontcolor: Colors.grey),
                 Expanded(
                  child: Divider(
                    color: Colors.grey.withOpacity(0.5),
                    thickness: 0.8,
                          endIndent: 15, 
                          indent: 10,    
                  ),
                ),
              ],
            ),
        const    Padding(
              padding:  EdgeInsets.only(left: 20,right: 20,top: 20),
              child: SingupButton(text: 'Google', backgroundcolor: Color.fromARGB(255, 167, 167, 167),   titlesize: 15, fontwidget: FontWeight.w500, fontcolor:blackColor , buttonhight: 50,),
            ),
            
                ],),
            ),
          ),
        ],
      )),);
  }
}

