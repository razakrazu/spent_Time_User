
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
            border: Border.all(width: 1)),
        child: TextButton(
            onPressed:ontap ,
            child:  Text(buttontext)));
  }
}