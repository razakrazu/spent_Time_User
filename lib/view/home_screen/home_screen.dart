
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/controller/calect_datas.dart';
import 'package:speat_time_user/view/booking_screen/room_details_screen.dart';



class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   final CalectDatas userController = CalectDatas();
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
   
      body: SafeArea(
      child: ListView( 
        children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.notes)),
               CircleAvatar(),
        
          ],),
        ),
       
    const    Padding(
          padding:  EdgeInsets.only(left: 17,right: 17,),
          child: Text('Lets Explore Best Hotels',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 25),),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 17,right: 17,top: 10),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(10),
                
              ),
              
                prefixIcon: Icon(Icons.search),
              hintText: 'Search',
         
            ),
          ),
        ),
const  SizedBox(height: 10,),
  const      Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text('Categories',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
        ),
        Container(   
            height: 60,
            child: 
               ListView.builder(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0),
                        borderRadius: BorderRadius.circular(10),
                         color:const Color.fromARGB(255, 223, 223, 223),
                      ),
                  
                      margin: const EdgeInsets.all(8),
                      child: Center(child: Text(data[index])),
                    );
                  }),
            ),
                
        Container(
            height: 260,
            width: 200,
            child: StreamBuilder(
              stream:userController.getAccepted(),
              builder:( BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }
                return  ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                 DocumentSnapshot document = snapshot.data!.docs[index];
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        String id = document.id;

                  return GestureDetector(
                    onTap: (){
            //  userController.deleteDataFromFirebase(id);
                         print('$id');
                        Get.to(
                            RoomDetailScreen(
                               id: id,
                               data: data,
                            ),
                            arguments: data);
          },
          child: Container(
                        width: 320,    
                        height: 200,               
                        decoration: BoxDecoration(
                          border: Border.all(width: 0),
                          borderRadius: BorderRadius.circular(12),
                           color: Color.fromARGB(255, 223, 223, 223),
                        ),              
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                          Container(
                            height: 170,
                            width: 320,
                            decoration:const BoxDecoration(
                            
                          
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),
                            ),   
                            child: CachedNetworkImage(
                              
  imageUrl: (data['listImages'] as List<dynamic>).isNotEmpty ? data['listImages'][0] : '',
  // Other parameters...
  height: 100,
  width: 100,
  fit: BoxFit.cover,
),                  
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  Text('Name :${data['propertyname']??''}',style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),),
                                IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border))
                              ],
                            ),
                          ),
        
        
                          
                                          Padding(
                            padding:  EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Text('Location :${data['city']??''}',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              Text('Night/${data['propertyPrice']??''}''',style:const TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                          
                                
                              ],
                            ),
                          ),
                        ],),
                      ),
        );

        //       },
        //       children: snapshot.data!.docs.map((DocumentSnapshot document){
        //              Map<String, dynamic> data =
        //           document.data() as Map<String, dynamic>;
        //       String id = document.id;
        // return  
        //       }).toList()
                
              }
                 );
              
              }
         
              
            )),
        



const  SizedBox(height: 10,),
  const      Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text('Populer Rooms',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
        ),

   Container(
            height: 220,
            width: 220,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 180,    
                    decoration: BoxDecoration(
                      border: Border.all(width: 0),
                      borderRadius: BorderRadius.circular(12),
                       color: Color.fromARGB(255, 223, 223, 223),
                    ),              
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                      Container(
                        height: 140,
                        width: 320,
                        decoration:const BoxDecoration(
                        image: DecorationImage(image:AssetImage('lib/assets/sdkdjsa.jpg',),
                    

                        fit: BoxFit.fill, ),
                      
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),
                        ),                     
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                                 const Text('Rose villa',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,),),
                            IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                          ],
                        ),
                      ),
                      
                                const      Padding(
                        padding:  EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Text('Rose villa',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                          Text('Night/3000',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400),),
                      
                            
                          ],
                        ),
                      ),
                    ],),
                  );
                })),
                
const  SizedBox(height: 10,),
  const      Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text('Populer Rooms',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
        ),

   GestureDetector(
onTap: (){
   },
     child: GestureDetector(
      onTap: (){
      },
       child: Container(
                height: 220,
                width: 220,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 180,    
                        decoration: BoxDecoration(
                          border: Border.all(width: 0),
                          borderRadius: BorderRadius.circular(12),
                           color: Color.fromARGB(255, 223, 223, 223),
                        ),              
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                          
                          Container(
                            height: 140,
                            width: 320,
                            decoration:const BoxDecoration(
                            image: DecorationImage(image:AssetImage('lib/assets/sdkdjsa.jpg',),
                                            
                          
                            fit: BoxFit.fill, ),
                          
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),
                            ),                     
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                     const Text('Rose villa',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,),),
                                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                              ],
                            ),
                          ),
                          
                                    const      Padding(
                            padding:  EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Text('Rose villa',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                              Text('Night/3000',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400),),
                          
                                
                              ],
                            ),
                          ),
                        ],),
                      );
                    })),
     ),
   ),
                const  SizedBox(height: 10,),
  const      Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text('Populer Rooms',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
        ),



 
   Container(
            height: 220,
            width: 220,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 180,    
                    decoration: BoxDecoration(
                      border: Border.all(width: 0),
                      borderRadius: BorderRadius.circular(12),
                       color: Color.fromARGB(255, 223, 223, 223),
                    ),              
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                      Container(
                        height: 140,
                        width: 320,
                        decoration:const BoxDecoration(
                        image: DecorationImage(image:AssetImage('lib/assets/sdkdjsa.jpg',),
                    

                        fit: BoxFit.fill, ),
                      
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13) ),
                        ),                     
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                                 const Text('Rose villa',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,),),
                            IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                          ],
                        ),
                      ),
                      
                                const      Padding(
                        padding:  EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Text('Rose villa',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                          Text('Night/3000',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400),),
                      
                            
                          ],
                        ),
                      ),
                    ],),
                  );
                })),

    ],)),);
  }
}


