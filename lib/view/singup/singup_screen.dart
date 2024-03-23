import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/controller/singup/authentication_repository.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/bottom_navigation/bottom_navigation.dart';
import 'package:speat_time_user/view/login_screen/login_screen.dart';
import 'package:speat_time_user/view/widgets/button.dart';
import 'package:speat_time_user/view/widgets/my_text_button.dart';
import 'package:speat_time_user/view/widgets/my_text_form_field.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

final TextEditingController username = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController loginpassword = TextEditingController();
final signKey =GlobalKey<FormState>();
class SingUpScreen extends StatelessWidget {
  AuthenticationController authController = Get.put(AuthenticationController());
  SingUpScreen({super.key});
 var agreeall = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          const Image(
            image: AssetImage(
                'lib/assets/roberto-nickson-so3wgJLwDxo-unsplash.jpg'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 190),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white),
              child: Form(
                key: signKey,
                child: ListView(
                  
                  children: [
                    height50,
                      const          Center(
                      child:  MyTextWidgets(
                          title: 'Get Started',
                          fontsize: 30,
                          fontwidget: FontWeight.bold,
                          fontcolor: blackColor),
                    ),
              
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: MyTextFormField(
                        labal: 'Enter Your Name',
                        icon: Icons.person,
                        controller: username,
                        validation: (value){
                          if(value==null){
                            return 'please enter name';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 25),
                      child: MyTextFormField(
                        labal: 'Enter Your Email',
                        icon: Icons.mail,
                        controller: email,
                         validation: (value){
                          if(value==null){
                            return 'please enter name';
                          }
                        },
                      ),
                    ),
                    
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 25),
                      child: MyTextFormField(
                        labal: 'Enter Your Password',
                        icon: Icons.lock,
                        controller: password,
                 validation: (value){
                          if(value==null){
                            return 'please enter name';
                          }
                        },
                      ),
                    ),
                    height20,
                  
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: agreeall,
                                onChanged: (bool? value) {
                                  agreeall = value!;
                                },
                              ),
                              MyTextWidgets(
                                title: 'I agree to the processing of',
                                fontsize: 15,
                                fontwidget: FontWeight.normal,
                                fontcolor: Color.fromARGB(255, 152, 152, 152).withOpacity(0.9),
                              ),
                            ],
                          ),
                   const       MyTextButton(
                              text: 'Personal data',
                              fontsize: 15,
                              fontwidget: FontWeight.w600,
                              fontcolor: Colors.blue)
                        ],
                      ),
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
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: SingupButton(
                        text: 'Sign up',
                        titlesize: 22,
                        fontcolor: blackColor,
                        fontwidget: FontWeight.w600,
                        backgroundcolor: const Color.fromARGB(255, 153, 209, 255),
                        onaction:  () async {
                          if(signKey.currentState!.validate()){
                
  await authController.signUp(
                          userName: username.text.trim(),
                          email: email.text.trim(),
                          password: password.toString(),
              
                        );
                             if (authController.user.value != null) {
                   
                        Get.to( const  BottomNavigationBarExample()); 
                          
                }
                          }
             
                   
              },
              
                        buttonhight: 50,
                      ),
                    ),
                    height20,
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Divider(
                    //         color: Colors.grey.withOpacity(0.5),
                    //         thickness: 0.8,
                    //         indent: 15,
                    //         endIndent: 10,
                    //       ),
                    //     ),
                    //     const MyTextWidgets(
                    //         title: 'Sign up with',
                    //         fontsize: 15,
                    //         fontwidget: FontWeight.normal,
                    //         fontcolor: Colors.grey),
                    //     Expanded(
                    //       child: Divider(
                    //         color: Colors.grey.withOpacity(0.5),
                    //         thickness: 0.8,
                    //         endIndent: 15,
                    //         indent: 10,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding:const EdgeInsets.only(left: 20, right: 20, top: 0),
                      child: SingupButton(
                        text: 'Google',
                        backgroundcolor: const Color.fromARGB(255, 167, 167, 167),
                        titlesize: 15,
                        fontwidget: FontWeight.w500,
                        fontcolor: blackColor,
                        buttonhight: 50,
                        onaction: () {
                          Get.to(  LoginScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
