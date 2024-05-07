import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:speat_time_user/controller/booking_room.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/model/booking_room.dart';
import 'package:speat_time_user/view/booking_screen/mytext_field_widget.dart';
import 'package:speat_time_user/view/booking_screen/payment_screen.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen(
      {super.key,
      required this.userData,
      required this.userId,
      required this.bookingId,
      required this.propertyImages,
      required this.propertyname});
  final String userId;
  final Map<String, dynamic> userData;
  final bookingId;
  final List propertyImages;
  final String propertyname;
  @override
  Widget build(BuildContext context) {
    UserDatas userController = UserDatas();

    log('$propertyImages');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking Room',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 86, 120, 92),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: 900,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/new add room.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 90,
                    ),
                    child: Row(
                      children: [
                        width20,
                        GestureDetector(
                          onTap: () {
                            userController.chooseDateRangePicker();
                          },
                          child: Container(
                            width: 160,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1)),
                            child: Center(
                              child: Obx(
                                () => Text(
                                  DateFormat(
                                    'dd-MM-yyyy',
                                  )
                                      .format(
                                          userController.dateRnage.value.start),
                                      
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                        width30,
                        Container(
                          width: 160,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1)),
                          child: Center(
                            child: Obx(
                              () => Text(
                                DateFormat(
                                  'dd-MM-yyyy',
                                )
                                    .format(userController.dateRnage.value.end),
                                   
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height20,
                  Row(
                    children: [
                      width20,
                      MyTextFormFieldWidget(
                        hinttext: 'Room',
                        Icon: const Icon(Icons.bed_outlined),
                        controller: userController.roomcount,
                      ),
                      width30,
                      MyTextFormFieldWidget(
                        hinttext: 'Guest',
                        Icon: const Icon(Icons.people),
                        controller: userController.guest,
                      ),
                    ],
                  ),
                  height20,
                  Row(
                    children: [
                      width20,
                      Container(
                          width: 160,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1)),
                          child: TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('Cancel'))),
                      width30,
                      Container(
                          width: 160,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1)),
                          child: TextButton(
                              onPressed: () async {
                                final bookingDatas = BookingModel(
                                  checkIn: userController.dateRnage.value.start
                                      .toString(),
                                  checkOut: userController.dateRnage.value.end
                                      .toString(),
                                  roomCount: userController.roomcount.text,
                                  guest: userController.guest.text,
                                  roomId: userId,
                                  propertyImages: propertyImages,
                                  propertyname: propertyname,
                                  userId: userData['userId'],
                                );

                                final respons = await userController
                                    .newBooking(bookingDatas);

                                if (respons) {
                                  Get.snackbar(
                                      'success', 'Your table is reserved',
                                      backgroundColor: Colors.green);
                                } else {
                                  Get.snackbar('failed',
                                      'Check your internet connection',
                                      backgroundColor: Colors.red);
                                }
                              },
                              child: const Text('Apply'))),
                    ],
                  ),
                  height30,
                  Container(
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1)),
                      child: TextButton(
                          onPressed: () {
                            Get.to(const RazorpayScreeen());
                          },
                          child: const Text('Payment'))),
                ],
              ),
            )),
      ),
    );
  }
}
