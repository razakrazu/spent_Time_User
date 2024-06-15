import 'package:flutter/material.dart';

class DivederLine extends StatelessWidget {
  const DivederLine({
    super.key,required this.right,required this.left,
  });
final double right;
final double left;

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: EdgeInsets.only(right: right,left: left, ),
            child: Divider(
              color: Color.fromARGB(255, 134, 132, 132).withOpacity(0.5),
              thickness: 2,
            ),
          );
  }
}