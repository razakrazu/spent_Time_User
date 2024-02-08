import 'package:flutter/material.dart';

class MyTextWidgets extends StatelessWidget {
  const MyTextWidgets({
    super.key,
    required this.title,
    required this.fontsize,
    required this.fontwidget,
    required this.fontcolor,
  });
  final String title;
  final double fontsize;
  final fontwidget;
  final Color fontcolor;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: fontwidget, color: fontcolor, fontSize: fontsize),
    );
  }
}
