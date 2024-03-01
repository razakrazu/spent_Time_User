import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/singup/singup_screen.dart';
import 'package:speat_time_user/view/widgets/button.dart';
import 'package:speat_time_user/view/widgets/my_text_button.dart';
import 'package:speat_time_user/view/widgets/my_text_form_field.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var rememberPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
   const     Image(
          image:
              AssetImage('lib/assets/roberto-nickson-so3wgJLwDxo-unsplash.jpg'),
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
                color: Color.fromARGB(255, 250, 250, 250)),
            child: ListView(
              children: [
                height50,
                Center(
                  child: const MyTextWidgets(
                      title: 'Welcome',
                      fontsize: 30,
                      fontwidget: FontWeight.bold,
                      fontcolor: blackColor),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 25),
                  child: MyTextFormField(
                    labal: 'Email',
                    icon: Icons.mail,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 25),
                  child: MyTextFormField(
                    labal: 'Password',
                    icon: Icons.lock,
                  ),
                ),
                height20,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberPassword,
                            onChanged: (bool? value) {
                              rememberPassword = value!;
                            },
                          ),
                          MyTextWidgets(
                            title: 'Remember me',
                            fontsize: 15,
                            fontwidget: FontWeight.normal,
                            fontcolor: Colors.grey.withOpacity(0.9),
                          ),
                        ],
                      ),
               const       MyTextButton(
                          text: 'Forgot Password?',
                          fontsize: 15,
                          fontwidget: FontWeight.w600,
                          fontcolor: Colors.blue)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
                  child: SingupButton(
                    text: 'LogIn',
                    titlesize: 22,
                    fontcolor: blackColor,
                    fontwidget: FontWeight.w600,
                    backgroundcolor: const Color.fromARGB(255, 153, 209, 255),
                    onaction: () {},
                    buttonhight: 50,
                  ),
                ),
                height20,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.withOpacity(0.5),
                        thickness: 0.8,
                        indent: 15,
                        endIndent: 10,
                      ),
                    ),
                    const MyTextWidgets(
                        title: 'Sign up with',
                        fontsize: 15,
                        fontwidget: FontWeight.normal,
                        fontcolor: Colors.grey),
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
                height10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextWidgets(
                      title: 'Dont have an account?',
                      fontsize: 15,
                      fontwidget: FontWeight.normal,
                      fontcolor: Colors.grey.withOpacity(0.9),
                    ),
                    MyTextButton(
                        text: 'Sign up ',
                        fontsize: 15,
                        fontwidget: FontWeight.w500,
                        fontcolor: Colors.blue,
                        onaction: ()=> Get.to(SingUpScreen()),)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    )));
  }
}
