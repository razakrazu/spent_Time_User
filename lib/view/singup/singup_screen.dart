import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/controller/singup_controller.dart';
import 'package:speat_time_user/model/singup_model.dart';
import 'package:speat_time_user/view/bottom_navigation/bottom_navigation.dart';
import 'package:speat_time_user/view/widgets/my_text_button.dart';
import 'package:speat_time_user/view/widgets/my_text_form_field.dart';

class SingUpScreen extends StatelessWidget {
   SingUpScreen({super.key});
  final  SingupData singupController = Get.put(SingupData());
  @override
  Widget build(BuildContext context) {
 
    return Scaffold( body: SafeArea(
      child: Column(
        children: [
Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextFormField(labal: 'Enter Your Name', icon: Icons.person, controller: singupController.username,),
),
Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextFormField(labal: 'Enter Your Email', icon: Icons.mail, controller: singupController.email,),
),
Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextFormField(labal: 'Enter Your Password', icon: Icons.lock, controller: singupController.password,),
),


Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextButton(label: 'SingUp',
   pressed: () async {
     bool success = await singupController.addUser(
                    SingupModel(
                      name: singupController.username.text,
                      mail: singupController.email.text,
                       Password: singupController.password.text,
                    ),
                  );

                  if (success) {
                    Get.to(BottomNavigation());
                  } else {
                    // Handle error
                  }
  },),
)
    ],)),);
  }
}


