import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/settings/profile_screen.dart';
import 'package:speat_time_user/view/settings/widgets/button_widget.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
               appBar: AppBar(
     backgroundColor: const Color.fromARGB(255, 86, 120, 92),
        title:const MyTextWidgets(title: 'Settings', fontsize: 27, fontwidget: FontWeight.w900, fontcolor: whiteColor) ,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon:const Icon( Icons.arrow_back,color: Colors.white,),),
  ),
      body: 
    SafeArea(child: Container(
      
     
      child:  Column(
        children: [
          height20,
          SettingsButtonWidget(icon: Icon(Icons.person), btnText: 'My Account', iconBackGroundColor:  Color.fromARGB(255, 245, 245, 245),controller: (){
            Get.to(ProfileScreen());
          },),
          SettingsButtonWidget(icon: Icon(Icons.wallet_sharp), btnText: 'Payment Mothods',iconBackGroundColor: Color.fromARGB(255, 245, 245, 245),),
          SettingsButtonWidget(icon: Icon(Icons.settings), btnText: 'Settings',iconBackGroundColor:  Color.fromARGB(255, 245, 245, 245)),
          SettingsButtonWidget(icon: Icon(Icons.privacy_tip_outlined), btnText: 'Privacy Policey ',iconBackGroundColor:  Color.fromARGB(255, 245, 245, 245)),
          SettingsButtonWidget(icon: Icon(Icons.access_time_sharp), btnText: 'Help Center',iconBackGroundColor:  Color.fromARGB(255, 245, 245, 245)),
          SettingsButtonWidget(icon: Icon(Icons.logout_outlined), btnText: 'Logout',iconBackGroundColor: Color.fromARGB(255, 252, 131, 122),)




        ],
      ),)),);
  }
}

