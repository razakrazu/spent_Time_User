import 'package:flutter/material.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(image: AssetImage('lib/assets/roberto-nickson-so3wgJLwDxo-unsplash.jpg')),
          SafeArea(child: 
          MyTextWidgets(title: '', fontsize: 30, fontwidget: FontWeight.w700, fontcolor:blackColor )),

        ],
      ) ,
    );
  }
}