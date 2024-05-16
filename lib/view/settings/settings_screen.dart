import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/core/constants.dart';
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
        }, icon:Icon( Icons.arrow_back,color: Colors.white,),),
  ),
      body: 
    SafeArea(child: Container(
      
     
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right:11, top: 30 ),
            child: Container(
              height: 70,
                 decoration: BoxDecoration(
                
            borderRadius: BorderRadius.circular(15),
                
            color: const Color.fromARGB(255, 15, 15, 15).withOpacity(0.2)
                
                  ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right:10,  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(
                    children: [
                Container(
                    
                      height: 45,
                    
                      width: 42,
                    
                      decoration: BoxDecoration(
                    
                borderRadius: BorderRadius.circular(7),
                    
                color: Color.fromARGB(255, 0, 182, 91)
                    
                      ),
                    
                      child:  Icon(Icons.person),
                    
                    
                    
                    ),
                    width15,
                    MyTextWidgets(title: 'Profile', fontsize: 18, fontwidget: FontWeight.w600, fontcolor: blackColor),
                  
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],),
              ),
            ),
          )
        ],
      ),)),);
  }
}