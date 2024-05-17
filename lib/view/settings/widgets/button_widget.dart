import 'package:flutter/material.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class SettingsButtonWidget extends StatelessWidget {
  const SettingsButtonWidget({
    super.key,
    required this.icon,
    required this.btnText,
    this.controller, required this.iconBackGroundColor,
  });
  final Icon icon;
  final String btnText;
  final controller;
  final Color  iconBackGroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right:11, top: 10 ),
      child: GestureDetector(
        onTap: controller,
        child: Container(
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 15, 15, 15).withOpacity(0.1)),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        height: 45,
                        width: 42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: iconBackGroundColor),
                        child: icon),
                    width15,
                    MyTextWidgets(
                        title: btnText,
                        fontsize: 19,
                        fontwidget: FontWeight.w700,
                        fontcolor: blackColor),
                  ],
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
