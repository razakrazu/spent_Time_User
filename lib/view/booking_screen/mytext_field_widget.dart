import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFormFieldWidget extends StatelessWidget {
  const MyTextFormFieldWidget({
    super.key,
    this.hittext,
    this.Icon,
    required this.controller,
  });
  final controller;
  final hittext;
  final Icon;
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
          hintText: hittext,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 90, 90, 90),
          ),
          prefixIcon: Icon,
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
