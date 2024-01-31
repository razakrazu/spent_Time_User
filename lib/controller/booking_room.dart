
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/model/booking_room.dart';

class UserDatas extends GetxController{



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

Future<bool>bookingRoom(BookingModel bookingdata)async{
  Map<String,dynamic>?bookingDataModel ={
    'checkin':bookingdata.checkIn,
     'checkout':bookingdata.checkOut,
     'roomcount':bookingdata.roomCount,
     'guest':bookingdata.guests


  };
  try{
    await FirebaseFirestore.instance
    .collection('bookingDatas')
    .doc()
    .set(bookingDataModel);
    return true;

  }catch(e){
    return false;
  }
}



}