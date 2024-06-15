import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:speat_time_user/controller/singup/authentication_repository.dart';
import 'package:speat_time_user/controller/singup/profile.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/singup/singup_screen.dart';
import 'package:speat_time_user/view/widgets/button.dart';
import 'package:speat_time_user/view/widgets/my_text_form_field.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final  ProfileController profileController = ProfileController(); 
  AuthenticationController authController = Get.put(AuthenticationController());
    return Scaffold(
                  appBar: AppBar(
     backgroundColor: const Color.fromARGB(255, 86, 120, 92),
        title:const MyTextWidgets(title: 'Profile', fontsize: 27, fontwidget: FontWeight.w900, fontcolor: whiteColor) ,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon:const Icon( Icons.arrow_back,color: Colors.white,),),
  ),body: SafeArea(
    child: StreamBuilder(stream: profileController.getProfileDatas() ,
     builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
       
       if(!snapshot.hasData){
        return const CircularProgressIndicator();
       }
       return ListView(
      children: snapshot.data!.docs.map((DocumentSnapshot document){
return Padding(
    padding: const EdgeInsets.only(left: 15,right: 15, top: 50),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(70),
    image: DecorationImage(image: AssetImage('lib/assets/unperson.jpg')),
    border: Border.all()
        ),),
        height10,
          MyTextWidgets(title: 'Amal', fontsize: 16, fontwidget: FontWeight.w500, fontcolor: blackColor),
  height50,
           MyTextFormField(labal: 'Name', icon: Icons.person, controller: authController.username,),
          height15,
              MyTextFormField(labal: 'Email', icon: Icons.mail_outlined, controller: authController.email),
                       height15,
             const MyTextFormField(labal: 'Number ', icon: Icons.phone),
                       height15,
              MyTextFormField(labal: 'Password', icon: Icons.lock, controller: authController.password),



Padding(
  padding: const EdgeInsets.only(top: 60),
  child:   SingupButton(text: 'Edit profile', backgroundcolor: Colors.lightGreen, titlesize: 18, fontwidget: FontWeight.w600, fontcolor: whiteColor, onaction: (){}, buttonhight: 50),
)
        ],
      ),
  );
      }).toList()
       );
     },),
  ),);
  }
}