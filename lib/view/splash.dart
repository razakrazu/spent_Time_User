// ignore_for_file: unused_element

import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});





  @override
  Widget build(BuildContext context) {
    // SplashController  splshCntr = Get.put(SplashController()); 
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 49, 85),
      body: Center(
        child: Container(
          child:const Text(
                'SPENT TIME',
                style: TextStyle(
                    color:  Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w800,
                    fontSize: 45,
                    fontStyle: FontStyle.italic
                   ),
              ),
        ),
      ),
    );
  }
}