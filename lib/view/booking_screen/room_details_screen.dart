import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:speat_time_user/controller/user_datas.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/booking_screen/booking_screen.dart';
import 'package:speat_time_user/view/booking_screen/widgets/nearby_items_widgets.dart';
import 'package:speat_time_user/view/widgets/fasilitices_widgets.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class RoomDetailScreen extends StatelessWidget {
  RoomDetailScreen({
    super.key,
    required this.id,
    required this.data,
    required this.bookingId,
  });
  final String id;
  final Map<String, dynamic> data;
  final String bookingId;

  @override
  Widget build(BuildContext context) {
    OwnerDatas auth = OwnerDatas();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking Room',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 86, 120, 92),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                height: 300,
                width: 480,
                child: ListView.builder(
                    itemCount: (data['listImages'] as List<dynamic>).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      String imageUrl = data['listImages'][index];
                      return Container(
                        width: 380,
                        height: 300,
                        decoration: const BoxDecoration(
                            // image: DecorationImage(
                            //   image: AssetImage(
                            //     'lib/assets/sdkdjsa.jpg',
                            //   ),

                            //   // fit: BoxFit.fill,
                            // ),
                            ),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
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
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${data['propertyname']}',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, left: 20, top: 20),
                        child: Container(
                          height: 40,
                          width: 75,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 64, 144, 66),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 0)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.currency_rupee,
                                size: 20,
                                color: whiteColor,
                              ),
                              Text(
                                '${data['propertyPrice']}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      Text(
                        ' ${data['city']}, ${data['state']}',
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
                title: 'Room & Hotel Facilitices',
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30,  right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoomFutureIconWidgets(
                          futureicon: Icons.fastfood,
                          futuretext:
                              ' ${data['goodsefty'] == true ? 'Good Safty' : 'is not here'}   ',
                        ),
                        RoomFutureIconWidgets(
                          futureicon: Icons.wifi,
                          futuretext:
                              '${data['wifi'] == true ? 'Wifi' : 'is not here'}',
                        ),
                        RoomFutureIconWidgets(
                          futureicon: Icons.tv_outlined,
                          futuretext:
                              ' ${data['goodsefty'] == true ? 'Good Safty' : 'is not here'}   ',
                        ),
                        RoomFutureIconWidgets(
                          futureicon: Icons.ac_unit_outlined,
                          futuretext:
                              ' ${data['goodsefty'] == true ? 'Good Safty' : 'is not here'}   ',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoomFutureIconWidgets(
                          futureicon: Icons.lock_clock_outlined,
                          futuretext:
                              ' ${data['goodsefty'] == true ? 'Good Safty' : 'is not here'}',
                        ),
                        RoomFutureIconWidgets(
                          futureicon: Icons.bathtub_outlined,
                          futuretext:
                              ' ${data['goodsefty'] == true ? 'Good Safty' : 'is not here'}',
                        ),
                        RoomFutureIconWidgets(
                          futureicon: Icons.heat_pump,
                          futuretext:
                              ' ${data['heater'] == true ? 'Heater' : 'is not here'}',
                        ),
                        RoomFutureIconWidgets(
                          futureicon: Icons.ac_unit_outlined,
                          futuretext:
                              ' ${data['goodsefty'] == true ? 'Good Safty' : 'is not here'}   ',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,  right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoomFutureIconWidgets(
                            futureicon: Icons.meeting_room_outlined,
                            futuretext:
                                '${data['meetinghall'] == true ? 'Meeting Hall' : 'not avalable'}'),
                        RoomFutureIconWidgets(
                          futureicon: Icons.local_parking,
                          futuretext:
                              '${data['parking'] == true ? 'Parking' : 'is not here'}',
                        ),
                        RoomFutureIconWidgets(
                          futureicon: Icons.flash_on_outlined,
                          futuretext:
                              '${data['powerBackup'] == true ? 'power Backup' : 'is not here'}',
                        ),
                        RoomFutureIconWidgets(
                          futureicon: Icons.pool,
                          futuretext:
                              '${data['swimmingpool'] == true ? 'pool' : 'is not here'}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            height10,
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: MyTextWidgets(
                title: "What's Nearby",
                fontwidget: FontWeight.w800,
                fontsize: 20,
                fontcolor: Colors.black,
              ),
            ),
            height20,
const Padding(
              padding:  EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
             NearByItemsWidgets(icons: Icons.train_rounded, label: 'Railway Satation',),
             height10,          
           NearByItemsWidgets(icons: Icons.airplanemode_active_sharp, label: 'Air Port',),
             height10,
            NearByItemsWidgets(icons: Icons.directions_bus, label: 'Air Port',),
              height10,                      
             NearByItemsWidgets(icons: Icons.directions_car, label: 'Texi Car',),
              height10,
             NearByItemsWidgets(icons: Icons.restaurant, label: 'Restaurant',),
              height10,
            NearByItemsWidgets(icons: Icons.location_city, label: 'Town',),
               height10,
               NearByItemsWidgets(icons: Icons.local_hospital, label: 'Hospital',),
                height10,
              NearByItemsWidgets(icons: Icons.park, label: 'Park',),







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
            SizedBox(
              width: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    final Map<String, dynamic> userData =
                        await auth.getuserdata();
                    Get.to(
                      BookingScreen(
                        userData: userData,
                        userId: id,
                        bookingId: bookingId,
                        propertyImages: data['listImages'],
                        propertyname: data['propertyname'],
                      ),
                    );
                  },
                  child: const Text('Book & Pay Now'),
                ),
              ),
            ),
            height20,
          ],
        ),
      ),
    );
  }
}

