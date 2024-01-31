import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/booking_screen/booking_popup.dart';
import 'package:speat_time_user/view/widgets/fasilitices_widgets.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class RoomDetailScreen extends StatelessWidget {
   RoomDetailScreen({super.key, required this.adminId});
  final String adminId;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = Get.arguments as Map<String, dynamic>?;
DateTime date =DateTime.now();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                height: 300,
                width: 480,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 380,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/sdkdjsa.jpg',
                            ),

                            // fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 160, left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: const Color.fromARGB(
                                              255, 255, 255, 255)
                                          .withOpacity(0.3)),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      size: 23,
                                    ),
                                  )),
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: const Color.fromARGB(
                                              255, 255, 255, 255)
                                          .withOpacity(0.3)),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      size: 27,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    })),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '${data?['propertyname']}',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Container(
                          height: 40,
                          width: 75,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 64, 144, 66),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 0)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: 20,
                              ),
                              Text(
                                '${data?['propertyPrice']}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        ' ${data?['city']}, ${data?['state']}',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: Color.fromARGB(255, 166, 164, 164),
                height: 25,
                thickness: 2,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: MyTextWidgets(
                title: 'Hotel Facilitices',
                fontwidget: FontWeight.w800,
                fontsize: 20,
                fontcolor: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height10,
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.meeting_room_outlined,
                          futuretext: '${data?['meetinghall']}',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.local_parking,
                          futuretext: '${data?['parking']}',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.flash_on_outlined,
                          futuretext: '${data?['powerBackup']}',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.pool,
                          futuretext: '${data?['swimmingpool']}',
                        ),
                      ),
                    ],
                  ),
                  height30,
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.lock_clock_outlined,
                          futuretext: ' ${data?['goodsefty']}   ',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.wifi,
                          futuretext: '${data?['wifi']}',
                        ),
                      ),
                      width30,
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.tv_outlined,
                          futuretext: 'Tv',
                        ),
                      ),
                      width30,
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.ac_unit_outlined,
                          futuretext: 'Ac',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            height10,
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextWidgets(
                title: 'Room Facilitices',
                fontwidget: FontWeight.w800,
                fontsize: 20,
                fontcolor: Colors.black,
              ),
            ),
            height20,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height10,
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.ac_unit_outlined,
                          futuretext: '${data?['Ac']}',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.tv,
                          futuretext: '${data?['tv']}',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.heat_pump_outlined,
                          futuretext: 'Heater: ${data?['heater']}',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.wifi,
                          futuretext: '${data?['wifi']}',
                        ),
                      ),
                    ],
                  ),
                  height30,
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.lock_clock_outlined,
                          futuretext: ' Sefety   ',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.bathtub_outlined,
                          futuretext: 'tailetpool',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.tv_outlined,
                          futuretext: 'Tv',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.ac_unit_outlined,
                          futuretext: 'Ac',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: MyTextWidgets(
                title: 'Property Polices',
                fontwidget: FontWeight.w800,
                fontsize: 20,
                fontcolor: Colors.black,
              ),
            ),
            height20,
            const Row(
              children: [
                Icon(
                  Icons.label_important,
                ),
                width10,
                MyTextWidgets(
                  title: 'Room Polices',
                  fontwidget: FontWeight.w400,
                  fontsize: 15,
                  fontcolor: Color.fromARGB(255, 63, 63, 63),
                ),
              ],
            ),
            height10,
            const Row(
              children: [
                Icon(
                  Icons.label_important,
                ),
                width10,
                MyTextWidgets(
                  title: 'Room Polices',
                  fontwidget: FontWeight.w400,
                  fontsize: 15,
                  fontcolor: Color.fromARGB(255, 63, 63, 63),
                ),
              ],
            ),
            height10,
            const Row(
              children: [
                Icon(
                  Icons.label_important,
                ),
                width10,
                MyTextWidgets(
                  title: 'Room Polices',
                  fontwidget: FontWeight.w400,
                  fontsize: 15,
                  fontcolor: Color.fromARGB(255, 63, 63, 63),
                ),
              ],
            ),
            height10,
            const Row(
              children: [
                Icon(
                  Icons.label_important,
                ),
                width10,
                MyTextWidgets(
                  title: 'Room Polices',
                  fontwidget: FontWeight.w400,
                  fontsize: 15,
                  fontcolor: Color.fromARGB(255, 63, 63, 63),
                ),
              ],
            ),
            height10,
            SizedBox(
              width: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10)
                ,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(
                   BookingScreen()
                    );
                  },
                  child: Text('Book now'),
                ),
              ),
            ),
            height20,
            SizedBox(
              width: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Pay'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  }

