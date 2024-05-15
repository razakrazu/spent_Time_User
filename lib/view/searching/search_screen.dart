import 'package:flutter/material.dart';
import 'package:speat_time_user/core/color.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class SearchingScreen extends StatelessWidget {
  const SearchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        appBar: AppBar(
     backgroundColor: const Color.fromARGB(255, 86, 120, 92),
        title:const MyTextWidgets(title: 'Search', fontsize: 25, fontwidget: FontWeight.w800, fontcolor: whiteColor) ,
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon:Icon( Icons.arrow_back,color: Colors.white,),),
  ),
      body:  SafeArea(child:  Column(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
               const Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 30
            ),
            child: Text(
              'Lets Explore Best Hotels',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17, top: 10),
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
        ],
      ),
    ));
  }
}