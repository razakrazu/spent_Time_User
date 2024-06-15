import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/controller/singup/authentication_repository.dart';
import 'package:speat_time_user/controller/user_datas.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/booking_screen/room_details_screen.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, this.userId});
  final OwnerDatas userController = OwnerDatas();
  final AuthenticationController signupController = AuthenticationController();
  final userId;
  final data = [
    "Hotel",
    "Apartment",
    "Resort",
    "villa",
    "Home",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 120, 92),
        title: const MyTextWidgets(
            title: 'HOME',
            fontsize: 24,
            fontwidget: FontWeight.w700,
            fontcolor: whiteColor),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              signupController.signOut();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(),
          ),
        ],
      ),
      body: SafeArea(
          child: ListView(
        children: [
          height15,
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            height: 60,
            child: ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 223, 223, 223),
                    ),
                    margin: const EdgeInsets.all(8),
                    child: Center(child: Text(data[index])),
                  );
                }),
          ),
          Container(
              height: 570,
              width: 200,
              child: StreamBuilder(
                  stream: userController.getAccepted(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot document =
                              snapshot.data!.docs[index];
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          String id = document.id;

                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                RoomDetailScreen(
                                  id: id,
                                  data: data,
                                  bookingId: '',
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 340,
                                height: 298,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromARGB(255, 86, 120, 92)
                                      .withOpacity(0.3),
                                  //  Color.fromARGB(255, 223, 223, 223),
                                ),
                                child: Column(
                                                         
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SizedBox(
                                        height: 190,
                                        width: 340,
                                                                      
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              (data['listImages'] as List<dynamic>)
                                                      .isNotEmpty
                                                  ? data['listImages'][0]
                                                  : '',                                
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 20,right: 20,bottom: 3),
                                     child: Column(children: [
                                       Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Name :${data['propertyname'] ?? ''}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.favorite_border))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Location :${data['city'] ?? ''}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            'Night/${data['propertyPrice'] ?? ''}'
                                            '',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                     ],),
                                   )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  })),
        ],
      )),
    );
  }
}
