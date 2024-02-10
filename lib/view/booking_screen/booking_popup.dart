import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:speat_time_user/controller/booking_room.dart';
import 'package:speat_time_user/controller/calect_datas.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/booking_details/booking_details_screen.dart';
import 'package:speat_time_user/view/booking_screen/mytext_field_widget.dart';
import 'package:speat_time_user/view/booking_screen/payment_screen.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({
    super.key,
    required this.data,
    required this.clientId,
  });
  final clientId;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    OwnerDatas ownerController = OwnerDatas();
    UserDatas userController = UserDatas();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Room',
          style: const TextStyle(color: Colors.white),
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
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('lib/assets/new add room.jpg'
                      ),
                      fit: BoxFit.fill,
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90,),
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
                                      .format(userController.dateRnage.value.start)
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w600),
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
                                    .format(userController.dateRnage.value.end)
                                    .toString(),
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
                        hittext: 'Room',
                        Icon: const Icon(Icons.bed_outlined),
                        controller: userController.roomcount,
                      ),
                      width30,
                      MyTextFormFieldWidget(
                        hittext: 'Guest',
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
                              onPressed: ()  {
                                Get.to(BookingDetailsScreen(
                                  checkIn: userController.dateRnage.value.start
                                      .toString(),
                                  checkOut: userController.dateRnage.value.end
                                      .toString(),
                                  roomCount: userController.roomcount.text,
                                  guests: userController.guest.text,
                                  userId: data['UserId'],                             
                                  propertyname: data['propertyname'],               
                                  propertyImage: data['listImages'], 
                                  roomId: clientId, 
                                  
                                 ) );
      
                                // try {
                                //   QuerySnapshot querySnapshot =
                                //       await FirebaseFirestore.instance
                                //           .collection('bookingDatas')
                                //           .where('checkin',
                                //               isEqualTo: userInfo.checkIn)
                                //           .get();
      
                                //   if (querySnapshot.docs.isNotEmpty) {
                                //     Get.defaultDialog(
                                //       title: 'This Property Already Booked',
                                //       middleText:
                                //           'The property is already booked. Please choose a different one.',
                                //     );
                                //   } else {
                                //     await FirebaseFirestore.instance
                                //         .collection('bookingDatas')
                                //         .add(
                                //           userInfo.toJson(),
                                //         );
      
                                //     Get.back();
                                //     Get.snackbar(
                                //       'Success',
                                //       'Your room has been booked',
                                //       snackPosition: SnackPosition.BOTTOM,
                                //       colorText: Colors.white,
                                //       backgroundColor:
                                //           const Color.fromARGB(255, 61, 138, 63),
                                //       borderColor: Colors.white,
                                //       borderWidth: 0,
                                //     );
                                //   }
                                // } catch (e) {
                                //   Get.snackbar(
                                //     'Fail',
                                //     'Failed to book your room. Please try again later.',
                                //     snackPosition: SnackPosition.BOTTOM,
                                //     colorText: Colors.white,
                                //     backgroundColor: Colors.red,
                                //     borderWidth: 0,
                                //   );
                                // }
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
                       Get.to( const RazorpayScreeen());
                          },
                          child: const Text('Payment'))),
                ],
              ),
            )),
      ),
    );
  }
}
