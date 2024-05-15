import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:speat_time_user/controller/booking_details.dart';
import 'package:speat_time_user/controller/user_datas.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class BookingDetailsScreen extends StatelessWidget {
  BookingDetailsScreen({
    super.key,
  });
  RoomsBookingDatas getDataController = Get.put(RoomsBookingDatas());
  OwnerDatas RoomDataController = Get.put(OwnerDatas());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: AppBar(
     backgroundColor: const Color.fromARGB(255, 86, 120, 92),
        title:const MyTextWidgets(title: 'Bookings', fontsize: 27, fontwidget: FontWeight.w900, fontcolor: whiteColor) ,
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon:Icon( Icons.arrow_back,color: Colors.white,),),
  ),
      body: StreamBuilder(
        stream: getDataController.bookingStream.value,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              child: CircleAvatar(),
            );
          } else if (snapshot.hasError) {
            return Text('Error : ${snapshot.error}');
          } else if (snapshot.hasData) {
            List<DocumentSnapshot> bookings = snapshot.data!.docs;

            return ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                String bookingId = bookings[index].id;
                var bookingData =
                    bookings[index].data() as Map<String, dynamic>;
                var roomName = bookingData['propertyname'] ?? '';
                var guestCount = bookingData['guest'] ?? '';
                var checkIn = bookingData['checkin'] ?? '';
                var checkOut = bookingData['checkout'] ?? '';
                var roomCount = bookingData['roomcount'] ?? '';

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 140,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 212, 212, 212),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(10),
                                //     image: DecorationImage(
                                //         image: AssetImage(
                                //             bookingData['propertyImages']),
                                //         fit: BoxFit.cover)),
                                child: CachedNetworkImage(
                                  imageUrl: (bookingData['propertyImages']
                                              as List<dynamic>)
                                          .isNotEmpty
                                      ? bookingData['propertyImages'][0]
                                      : '',
                                  // Other parameters...
                                  height: 110,
                                  width: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyTextWidgets(
                                      title: 'Name: $roomName ',
                                      fontsize: 15,
                                      fontwidget: FontWeight.w600,
                                      fontcolor: const Color.fromARGB(
                                          255, 47, 47, 47)),
                                  MyTextWidgets(
                                      title: 'Room: $roomCount',
                                      fontsize: 15,
                                      fontwidget: FontWeight.w600,
                                      fontcolor: const Color.fromARGB(
                                          255, 57, 57, 57)),
                                  MyTextWidgets(
                                      title: 'Guest: $guestCount',
                                      fontsize: 15,
                                      fontwidget: FontWeight.w600,
                                      fontcolor: const Color.fromARGB(
                                          255, 48, 48, 48)),
                                  MyTextWidgets(
                                      title: 'CheckIn: ${DateFormat('dd-MM-yyyy').format(DateTime.parse(checkIn))}',
                                      fontsize: 15,
                                      fontwidget: FontWeight.w600,
                                      fontcolor: const Color.fromARGB(
                                          255, 58, 58, 58)),
                                  MyTextWidgets(
                                      title: 'CheckOut: ${DateFormat('dd-MM-yyyy').format(DateTime.parse(checkOut))}  ',
                                      fontsize: 15,
                                      fontwidget: FontWeight.w600,
                                      fontcolor: const Color.fromARGB(
                                          255, 54, 54, 54)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return const SizedBox(child: Text('error'));
          }
        },
      ),
    );
  }
}
