import 'package:flutter/material.dart';
import 'package:speat_time_user/controller/singup_controller.dart';
import 'package:speat_time_user/model/singup_model.dart';
import 'package:speat_time_user/view/widgets/my_text_button.dart';
import 'package:speat_time_user/view/widgets/my_text_form_field.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( body: SafeArea(
      child: Column(
        children: [
Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextFormField(labal: 'Enter Your Name', icon: Icons.person,),
),
Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextFormField(labal: 'Enter Your Email', icon: Icons.mail,),
),
Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextFormField(labal: 'Enter Your Password', icon: Icons.lock,),
),


Padding(
  padding: const EdgeInsets.all(10),
  child:   MyTextButton(label: 'SingUp', pressed: (){
       SingupData().addUser(
                    SinguModel(
                      name: SingupData().username.text,
                      mail: SingupData().email.text,
                     Password: SingupData().password.text,
                    ),
                  );
  },),
)
    ],)),);
  }
}


