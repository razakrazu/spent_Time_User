import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,required this.label,required this.pressed,
  });
final label;
final pressed;
  @override
  Widget build(BuildContext context) {
    return Container(
    
      width: 200,
    
      decoration: BoxDecoration(
    
        border: Border.all(width: 0),
    
        borderRadius: BorderRadius.circular(7),
    
        color: Color.fromARGB(255, 255, 255, 255)
    
      ),
    
      child: TextButton(onPressed: (){}, child: Text(label)));
  }
}