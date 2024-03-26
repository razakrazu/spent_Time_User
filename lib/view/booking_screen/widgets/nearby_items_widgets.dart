import 'package:flutter/material.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class NearByItemsWidgets extends StatelessWidget {
  const NearByItemsWidgets({
    super.key, required this.icons, required this.label,
  });
final IconData icons;
final String label;
 
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          
          color: const Color.fromARGB(255, 151, 150, 150).withOpacity(0.3),
          borderRadius: BorderRadius.circular(7)
        ),
        child: Icon(icons,color:const Color.fromARGB(255, 102, 101, 101),)),
        width10,
             MyTextWidgets(title: label,  fontsize: 16, fontwidget: FontWeight.w400, fontcolor:const Color.fromARGB(255, 102, 102, 102),)
    ],);
  }
}
