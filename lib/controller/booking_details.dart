
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speat_time_user/model/booking_room.dart';

class RoomsBookingDatas extends GetxController{


   final Rx<Stream<QuerySnapshot<Object?>>> bookingStream =
      Rx<Stream<QuerySnapshot<Object?>>>(const Stream.empty());
   final CollectionReference userBookingsCollection =
       FirebaseFirestore.instance.collection('users');
  String? userId; 

  @override
  void onInit() {
    super.onInit();
    getuserdata();

  
  }

  Stream<QuerySnapshot<Object?>> getBooking() {

            if(userId !=null){   
    final CollectionReference resturentCollection =
        FirebaseFirestore.instance.collection('users')
        .doc(userId)
        .collection('user_bookings');
           log('${userId}');

    final Stream<QuerySnapshot<Object?>> resturentStream =
        resturentCollection.snapshots();

    return resturentStream;
    }else{
      return Stream.empty();
    }
  }
  Future<void> getuserdata() async {
    SharedPreferences getuserId = await SharedPreferences.getInstance();
  userId = getuserId.getString('getuser_id');
    bookingStream.value = getBooking();
      }
  Future<void> cancelBooking(String bookingId, Map<String, dynamic> bookingData) async {
    try {
      if (userId != null) {
        await userBookingsCollection
            .doc(userId)
            .collection('user_bookings')
            .doc(bookingId)
            .delete(); 

        await FirebaseFirestore.instance
            .collection('approvedOne')
            .doc(userId)
            .collection('cancel_booking')
            .add(bookingData); 

        getuserdata();
      }
    } catch (e) {
      print("Error cancelling booking: $e");
    }
  }
  Future<bool> updatebooking(BookingModel book,String bookingId) async {
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
          .doc(bookingId).update(bookinfo);
          log('$userId');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(book.userId)
          .collection('user_bookings')
          .doc(bookingId).update(bookinfo);

      return true;
    } catch (e) {
      return false;
    }
  }
  

}