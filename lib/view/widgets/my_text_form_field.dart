import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.labal,
    required this.icon,
    this.controller, 
    this.validation,
  });
  final String labal;
  final IconData icon;
  final controller;
  final validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validation,

      controller: controller,

      // keyboardType: texttype,
  
      // maxLength: maxLength,

      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        label: Text(labal),
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 87, 87, 87),
        ),
        prefixIcon: Icon(
          icon,
          color: Color.fromARGB(255, 166, 166, 166),
        ),
      ),

      style: TextStyle(color: Colors.black),
    );
  }
}
