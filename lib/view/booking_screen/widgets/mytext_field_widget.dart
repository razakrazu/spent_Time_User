import 'package:flutter/material.dart';

class MyTextFormFieldWidget extends StatelessWidget {
  const MyTextFormFieldWidget({
    super.key,
   required this.hinttext,
   required  this.icon,
    this.controller,
  });
  final controller;
  final String hinttext;
  final IconData  icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontSize: 15,  
            color: Color.fromARGB(255, 90, 90, 90),
          ),
          prefixIcon: Icon(icon),
        ),

        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
