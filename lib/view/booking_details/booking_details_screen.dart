import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key, required propertyImage, required state, required propertyPrice, required city, required propertyname, required roomId, required userId, required String guests, required String roomCount, required String checkOut, required String checkIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return Column(children: [
             Container(height: 70,
             width: 300,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black
             ),)
        ],);
      },),
    );
  }
}