import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speat_time_user/model/booking_room.dart';

class UserDatas extends GetxController{

 Stream<QuerySnapshot<Object?>> bookingStream = const Stream.empty();
   Stream<QuerySnapshot<Object?>> bookdata = const Stream.empty(); 
  TextEditingController roomcount = TextEditingController();
  TextEditingController guest = TextEditingController(); 


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





Future<bool>newBooking(BookingModel book) async{
  Map<String,dynamic> bookInfo={
    
'checkin':book.checkIn,
'checkout':book.checkOut,
'roomcount':book.roomCount,
'guest':book.guest,
'roomId':book.roomId, 
'propertyImages':book.propertyImages,
'propertyname':book.propertyname
    };
    try {
      await FirebaseFirestore.instance
    .collection('approvedRooms')
    .doc(book.roomId)
    .collection('bookingDatas')
    .add(bookInfo);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(book.userId)
          .collection('user_bookings')
          .add(bookInfo);
  return true;
    } catch (e) {
      return false;
    }
}
// ---------------------------------------------------------------------------
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
Future<bool> userBooking(BookingModel book) async {
    Map<String, dynamic> bookinfo = {
   'checkin':book.checkIn,
'checkout':book.checkOut,
'roomcount':book.roomCount,
'guest':book.guest,
'roomId':book.roomId, 
'propertyImages':book.propertyImages,
'propertyname':book.propertyname
    };
    try {
      await FirebaseFirestore.instance
          .collection('approvedOne')
          .doc(book.userId)
          .collection('bookings')
          .add(bookinfo);

      return true;
    } catch (e) {
      return false;
    }
  }
// ---------------------------------------------------------------------------------------
  Future<void> fetchBookingHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('getuser_id');
    bookdata = fetchBookingData(userId);
    log('$bookdata');
  }

  
  Stream<QuerySnapshot<Object?>> getoffers(resturentId) {
    final CollectionReference resturentCollection = FirebaseFirestore.instance
        .collection('approvedOne')
        .doc(resturentId)
        .collection('offerdimg');
    final resturentStream = resturentCollection.snapshots();
    return resturentStream;
  }
// -----------------------------------------------------------------------------------------------
  Stream<QuerySnapshot<Object?>> getoffering() {
    final CollectionReference accepted =
        FirebaseFirestore.instance.collection('offers');
    final acceptStream = accepted.snapshots();
    return acceptStream;
  }
}