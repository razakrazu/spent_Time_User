import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/widgets/button.dart';
import 'package:speat_time_user/view/widgets/my_text_form_field.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  appBar: AppBar(
     backgroundColor: const Color.fromARGB(255, 86, 120, 92),
        title:const MyTextWidgets(title: 'Profile', fontsize: 27, fontwidget: FontWeight.w900, fontcolor: whiteColor) ,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon:const Icon( Icons.arrow_back,color: Colors.white,),),
  ),body: Padding(
    padding: const EdgeInsets.only(left: 15,right: 15, top: 50),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
          ),
          MyTextWidgets(title: 'Amal', fontsize: 16, fontwidget: FontWeight.w500, fontcolor: blackColor),
  height50,
          const MyTextFormField(labal: 'Name', icon: Icons.person),
          height15,
             const MyTextFormField(labal: 'Name', icon: Icons.person),
                       height15,
             const MyTextFormField(labal: 'Name', icon: Icons.person),
                       height15,
             const MyTextFormField(labal: 'Name', icon: Icons.person),



Padding(
  padding: const EdgeInsets.only(top: 60),
  child:   SingupButton(text: 'Edit profile', backgroundcolor: Colors.lightGreen, titlesize: 18, fontwidget: FontWeight.w600, fontcolor: whiteColor, onaction: (){}, buttonhight: 50),
)
        ],
      ),
  ),);
  }
}