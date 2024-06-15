import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/controller/user_datas.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/booking_screen/booking_screen.dart';
import 'package:speat_time_user/view/booking_screen/widgets/divider_line.dart';
import 'package:speat_time_user/view/booking_screen/widgets/nearby_items_widgets.dart';
import 'package:speat_time_user/view/widgets/button.dart';
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
      // appBar: AppBar(
      //   title: const Text(
      //     'Booking Room',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: const Color.fromARGB(255, 86, 120, 92),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
             Column(
               children: [
                 Container(
                        height: 380,
                        width: 480,
                        child: ListView.builder(
                            itemCount: (data['listImages'] as List<dynamic>).length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              String imageUrl = data['listImages'][index];
                              return Stack(
                                children: [
                                
                                  Container(
                                    width: 380,
                                    
                                    height: 300,
                                    
                                                             child: CachedNetworkImage(
                                    
                                      imageUrl: imageUrl,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      fit: BoxFit.cover,
                                      fadeInCurve: Curves.bounceInOut,
                                    ),
                                  ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15,top: 25),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      CircleAvatar(backgroundColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                                        child: IconButton(onPressed: (){
                                      Get.back();
                                      }, icon:Icon(Icons.arrow_back)),),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 260),
                                        child: CircleAvatar(backgroundColor: 
                                         Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                                        // Color.fromARGB(255, 189, 233, 255),
                                          child: IconButton(onPressed: (){
                                                                
                                        }, icon:Icon(Icons.favorite_border)),),
                                      )
                                      ],
                                                              ),
                                    ),
                                ],
                              );
                            })),
               ],
             ),
            Padding(
              padding: const EdgeInsets.only(top: 285),
              child: Container(
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)
                ),
                
                child: ListView(
                  children: [
                   
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        height: 100,
                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 212, 209, 209),
                                          borderRadius: BorderRadius.circular(5),
                                         ),
                        child: Padding(
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
                      ),
                    ),
                  const Padding(
                      padding: EdgeInsets.only(left: 10,top: 10),
                      child: MyTextWidgets(
                        title: 'About Room',
                        fontwidget: FontWeight.w800,
                        fontsize: 22,
                        fontcolor: Colors.black,
                      ),                     
                    ),
         const           DivederLine(right: 245.0,left:10.0 ,),
                      MyTextWidgets(
                        title: 'ected that you might be using a screen reader and has disabled PSReadLine for compatibility purposes. If you want to re-enable it, run Import-Module PSReadLin',
                        fontwidget: FontWeight.w500,
                        fontsize: 15,
                        fontcolor: Colors.black.withOpacity(0.4),
                      ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10,top: 10),
                      child: MyTextWidgets(
                        title: 'Room & Hotel Facilitices',
                        fontwidget: FontWeight.w800,
                        fontsize: 22,
                        fontcolor: Colors.black,
                      ),
                    ),
            const           DivederLine(right: 125.0,left:10.0 ,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20 ,right: 20,top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RoomFutureIconWidgets(
                                  futureicon: Icons.fastfood,
                                  futuretext:
                                      ' ${data['food'] == true ? 'Food' : 'Not here'} ',
                                ),
                               RoomFutureIconWidgets(
                                    futureicon: Icons.meeting_room_outlined,
                                    futuretext:
                                        '${data['meetinghall'] == true ? 'Meeting Hall' : 'Not here'}'),
                     
                                RoomFutureIconWidgets(
                                  futureicon: Icons.ac_unit_outlined,
                                  futuretext:
                                      ' ${data['Ac'] == true ? 'Ac' : 'Not here'}   ',
                                ),
                                RoomFutureIconWidgets(
                                  futureicon: Icons.lock_clock_outlined,
                                  futuretext:
                                      ' ${data['goodsefty'] == true ? 'Good Safty' : 'Not here'}',
                                ),
                              ],
                            ),
                          ),
                         
                          Padding(
                            padding: const EdgeInsets.only(top: 20, ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              
                                           RoomFutureIconWidgets(
                                  futureicon: Icons.wifi,
                                  futuretext:
                                      '${data['wifi'] == true ? 'Wifi' : 'Not here'}',
                                ),
                                   RoomFutureIconWidgets(
                                  futureicon: Icons.flash_on_outlined,
                                  futuretext:
                                      '${data['powerBackup'] == true ? 'Power Backup' : 'Not here'}',
                                ),
                                RoomFutureIconWidgets(
                                  futureicon: Icons.local_parking,
                                  futuretext:
                                      '${data['parking'] == true ? 'Parking' : 'Not here'}',
                                ),
                             
                                RoomFutureIconWidgets(
                                  futureicon: Icons.pool,
                                  futuretext:
                                     '${data['swimmingpool'] == true ? 'pool' : 'Not here'}',
                                ),
                              ],
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(top: 20, ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                                 RoomFutureIconWidgets(
                                  futureicon: Icons.tv_outlined,
                                  futuretext:
                                      ' ${data['tv'] == true ? 'Tv' : 'Not here'}   ',
                                ),
                                RoomFutureIconWidgets(
                                  futureicon: Icons.videocam_outlined,
                                  futuretext:
                                      ' ${data['cctv'] == true ? 'CCtv' : 'Not here'}',
                                ),
                                RoomFutureIconWidgets(
                                  futureicon: Icons.heat_pump,
                                  futuretext:
                                      ' ${data['heater'] == true ? 'Heater' : 'Not here'}',
                                ),
                                RoomFutureIconWidgets(
                                  futureicon: Icons.fitness_center,
                                  futuretext:
                                      ' ${data['WorkOut'] == true ? 'Gym' : 'Not here'}   ',
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
                    height10,
                           Padding(
                      padding:const  EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                     NearByItemsWidgets(icons: Icons.train_rounded, label:' ${data['railwayStation']==true?'Railway Satation':'is not here'}',),
                     height10,          
                   NearByItemsWidgets(icons: Icons.airplanemode_active_sharp, label: ' ${data['airport']==true?'Air Port':'is not here'}',),
                     height10,
                    NearByItemsWidgets(icons: Icons.directions_bus, label: ' ${data['busStant']==true?'Bus Stant':'is not here'}',),
                      height10,                      
                     NearByItemsWidgets(icons: Icons.directions_car, label:' ${data['texiStation']==true?'Texi Stant':'is not here'}',),
                      height10,
                     NearByItemsWidgets(icons: Icons.restaurant, label:' ${data['restorent']==true?'Resroren':'is not here'}',),
                      height10,
                    NearByItemsWidgets(icons: Icons.location_city, label:' ${data['town']==true?'Town':'is not here'}',),
                       height10,
                       NearByItemsWidgets(icons: Icons.local_hospital, label: ' ${data['hospital']==true?'Hospital':'is not here'}',),
                        height10,
                      NearByItemsWidgets(icons: Icons.park, label:' ${data['park']==true?'Park':'is not here'}',),
                          
                          
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
                    height10,
                     Row(
                      children: [
                  const      Icon(
                          Icons.label_important,
                        ),
                        width10,
                        MyTextWidgets(
                          title: '${data['property Roles']}',
                          fontwidget: FontWeight.w400,
                          fontsize: 15,
                          fontcolor: const Color.fromARGB(255, 63, 63, 63),
                        ),
                      ],
                    ),
              SizedBox(height: 80,),
                  ],
                ),
              ),
            ),
            
               
                          Padding(
                            padding: const EdgeInsets.only(top: 750,left: 20,right: 20),
                            child: SingupButton(
                                                  text: 'Book Now',
                                                  titlesize: 22,
                                                  fontcolor: whiteColor,
                                                  fontwidget: FontWeight.w600,
                                                  backgroundcolor: Color.fromARGB(255, 102, 187, 119) ,
                                                  onaction:  () async {
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
                                       
                                             
                                        
                                        
                                                  buttonhight: 50,
                                                ),
                          ),
          ],
        ),
      ),
    );
  }
}



