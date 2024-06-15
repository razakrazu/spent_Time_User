
import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {


const AppButtonWidget({
    super.key,required this.buttontext, required this.ontap, required this.btnHeight, required this.btnWidth, 
  });
  final double  btnHeight;
  final double btnWidth;
  final String  buttontext;

  final  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: btnWidth,
        height: btnHeight ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 99, 181, 115) ,
         ),
            
        child: TextButton(
            onPressed:ontap ,
            child:  Text(buttontext,style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.w900,fontSize: 19),)));
  }
}