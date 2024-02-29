import 'package:flutter/material.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(image: AssetImage('lib/assets/roberto-nickson-so3wgJLwDxo-unsplash.jpg'),fit: BoxFit.cover,
          width:  double.infinity,
          height: double.infinity,
        ),
          SafeArea(child: 
          Padding(
            padding: const EdgeInsets.only(top: 340),
            child: Column(
              children: [
            //     MyTextWidgets(title: 'Welcome', fontsize: 30, fontwidget: FontWeight.w700, fontcolor:whiteColor ),
            //     height10,
            // MyTextWidgets(title: 'Welcome', fontsize: 30, fontwidget: FontWeight.w700, fontcolor:whiteColor ),
                

Padding(
                  padding: const EdgeInsets.only(top: 395,),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 13,
                        child: Container(
                          height: 60,
                          width: 190,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 155, 155, 155),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30)
                                      
                          )
                          ),
                          child: Center(child: MyTextWidgets(title: 'LogIn', fontsize: 30, fontwidget: FontWeight.w400, fontcolor: whiteColor)),
                        ),
                      ),
                      
                        Flexible(
                          flex: 13,
                          child: Container(
                               height: 60,
                          width: 190,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 155, 155, 155),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30)
                                        
                          )
                          ),
                          child: Center(child: MyTextWidgets(title: 'SingUp', fontsize:30, fontwidget: FontWeight.w400, fontcolor: whiteColor)),
                                              ),
                        ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),

     
          ),

        ],
      ) ,
    );
  }
}