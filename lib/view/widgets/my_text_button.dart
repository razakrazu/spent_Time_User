import 'package:flutter/material.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.text,
 
    required this.fontsize,
   required this.fontwidget,
   required this.fontcolor,

    this.onaction,
  });
  final String text;


  final double fontsize;
  final fontwidget;
  final fontcolor;

  final onaction;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: MyTextWidgets(
          title:text,
          fontsize: fontsize,
          fontwidget:fontwidget,
          fontcolor:fontcolor),
    );
  }
}
