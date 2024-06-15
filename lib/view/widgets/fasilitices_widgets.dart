import 'package:flutter/material.dart';

class RoomFutureIconWidgets extends StatelessWidget {
  const RoomFutureIconWidgets({
    super.key,
    required this.futureicon,
    required this.futuretext,
  });
  final IconData futureicon;
  final String futuretext;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          
          color: const Color.fromARGB(255, 151, 150, 150).withOpacity(0.3),
          borderRadius: BorderRadius.circular(7)
        ),
          child: Icon(
            futureicon,
            size: 35,
            color: const Color.fromARGB(255, 75, 75, 75),
          ),
        ),
        Text(
          futuretext,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 12),
        ),
      ],
    );
  }
}
