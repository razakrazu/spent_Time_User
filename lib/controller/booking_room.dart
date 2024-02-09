import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speat_time_user/model/booking_room.dart';

class UserDatas extends GetxController{

 Stream<QuerySnapshot<Object?>> bookingStream = const Stream.empty();
   Stream<QuerySnapshot<Object?>> bookdata = const Stream.empty(); 
  final roomcount = TextEditingController();
  final guest = TextEditingController(); 
var dateRnage = DateTimeRange(
  start: DateTime.now(),
 end: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+1)).obs;
chooseDateRangePicker()async{

 DateTimeRange?picker = await showDateRangePicker(context: Get.context!,
  firstDate: DateTime(DateTime.now().year -20),
   lastDate: DateTime(DateTime.now().year+20),
   initialDateRange: dateRnage.value,
   );
if(picker != null && picker != dateRnage.value){
 dateRnage.value = picker; 
}
}



var userdatas=RxList<BookingModel>();
final dB = FirebaseAuth.instance;
final Storage = FirebaseStorage.instance;

Future<bool>userBooklingAddToFilrebase(String bookingdata,String roomId)async{ 
  try{
    await FirebaseFirestore.instance.collection('books').add({
      'roomId':roomId,
      'startDate':dateRnage.value.start,
      'endDate':dateRnage.value.end,
      'room':int.parse(roomcount.text),
      'guestCount':int.parse(guest.text),
    });
  log('book details add to  Firebase');
   
    return true;

  }catch(e){
      log('Error adding book details');
    return false;
  }
}
         

Future<bool>newBooking(BookingModel book) async{
  Map<String,dynamic> bookinginfo ={


    'CheckIn':book.checkIn,
    'CheckOut':book.checkOut,
    'gestCount':book.guests,
    'roomCount':book.roomCount,
    'userId':book.userId,

  };
  try{
    await FirebaseFirestore.instance
    .collection('approvedRooms')
    .doc(book.roomId)
    .collection('bookingDatas')
    .add(bookinginfo);
    await FirebaseFirestore.instance
    .collection('users')
    .doc(book.userId)
    .collection('user_booking')
    .add(bookinginfo);
  return true;
  
}catch (e) {

return false;
}

}

  Stream<QuerySnapshot<Object?>> getResturentDatas(userId) {
    final CollectionReference resturentCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('user_booking');
    final resturentStream = resturentCollection.snapshots();
    return resturentStream;
  }
  

  Stream<QuerySnapshot> fetchBookingData(userId) {
  try {
    bookingStream = getResturentDatas(userId);
    return bookingStream;
  } catch (e) {
 
    return Stream.empty();
  }
}

   Future<void> fetchBookingHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('getuser_id');
 bookdata=  fetchBookingData(userId);
 log('$bookdata');
  }
}