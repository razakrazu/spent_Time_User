import 'package:flutter/material.dart';

class RoomFutureIconWidgets extends StatelessWidget {
  const RoomFutureIconWidgets({
    super.key,
    required this.futureicon,
    required this.futuretext,
  });
final futureicon;
final futuretext;
  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       Icon(futureicon,size: 35,color: const Color.fromARGB(255, 75, 75, 75),),
      Text(
          futuretext,
            style: const TextStyle(
             fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 12
              
            ),),
            
     ],
    );
  }
}