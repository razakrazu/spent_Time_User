
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/controller/user_datas.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/booking_screen/booking_popup.dart';
import 'package:speat_time_user/view/widgets/fasilitices_widgets.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class RoomDetailScreen extends StatelessWidget {
   RoomDetailScreen({super.key, required this.id, required this.data});
  final String id;
final Map<String,dynamic>data;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = Get.arguments as Map<String, dynamic>?;
OwnerDatas auth = OwnerDatas();
// UserDatas userController = UserDatas();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Room',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 86, 120, 92),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                height: 300,
                width: 480,
                child: ListView.builder(
                    itemCount: (data!['listImages'] as List<dynamic>).length,
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
                          CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
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
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '${data['propertyname']}',
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
                                '${data['propertyPrice']}',
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
                          futuretext: '${data['meetinghall']}',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.local_parking,
                          futuretext: '${data['parking']}',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.flash_on_outlined,
                          futuretext: '${data['powerBackup']}',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.pool,
                          futuretext: '${data['swimmingpool']}',
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
                          futuretext: ' ${data['goodsefty']}   ',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.wifi,
                          futuretext: '${data['wifi']}',
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
                          futuretext: '${data['Ac']}',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.tv,
                          futuretext: '${data['tv']}',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.heat_pump_outlined,
                          futuretext: 'Heater: ${data['heater']}',
                        ),
                      ),
                      width30,
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: RoomFutureIconWidgets(
                          futureicon: Icons.wifi,
                          futuretext: '${data['wifi']}',
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
                  onPressed: () async {
                    // final Map<String,dynamic>userData = await auth.getuserdata();
                    Get.to(
                   BookingScreen(data: data, clientId: id,
                 
                     
                    
                    ), 
                    );
                  },
                  child: const  Text('Book & Pay Now'),
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

