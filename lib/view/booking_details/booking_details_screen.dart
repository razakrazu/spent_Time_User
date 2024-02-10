import 'package:flutter/material.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({
    super.key,
   required propertyImage, 
     required propertyname,
     required roomId,
      required String guests,
      required String roomCount,
      required String checkOut,
      required String checkIn, required userId,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
        return Column(children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(height: 140,
               width: 350,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 212, 212, 212),
                
               ),
               child: Row(
                children: [
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
      height: 130,
    
    width: 150,
     decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
image: DecorationImage(image: AssetImage('lib/assets/djffjdjda.jpg'),
 fit: BoxFit.cover)                
               ),
   
  ),
),

Padding(
  padding: const EdgeInsets.only(left: 20,top: 20),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
  
  
  
  const  MyTextWidgets(title: 'SkyLine ', fontsize: 15, fontwidget: FontWeight.w600, fontcolor: Color.fromARGB(255, 47, 47, 47)),
  const  MyTextWidgets(title: 'Room: 1', fontsize: 15, fontwidget: FontWeight.w600, fontcolor: Color.fromARGB(255, 57, 57, 57)),
  const  MyTextWidgets(title: 'Guest: 2 ', fontsize: 15, fontwidget: FontWeight.w600, fontcolor: Color.fromARGB(255, 48, 48, 48)),
   const MyTextWidgets(title: 'CheckIn: 20/10/2024 ', fontsize: 13, fontwidget: FontWeight.w600, fontcolor: Color.fromARGB(255, 58, 58, 58)),
 const   MyTextWidgets(title: 'CheckOut: 03/04/2024  ', fontsize: 13, fontwidget: FontWeight.w600, fontcolor: Color.fromARGB(255, 54, 54, 54)),

  ],),
)
                ],
               ),
               ),
             ),
        ],);
      },),
    );
  }
}

