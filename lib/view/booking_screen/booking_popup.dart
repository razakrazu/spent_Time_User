import 'package:flutter/material.dart';
import 'package:speat_time_user/core/constants.dart';
import 'package:speat_time_user/view/booking_screen/mytext_field_widget.dart';

Future<dynamic> show_AddRoom_Popup(BuildContext context) {
  return showModalBottomSheet(
   
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Container(
        height: 400,
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
       
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            children: [
            
       const       Row(children: [
               width20,
                  MyTextFormFieldWidget(hittext: 'Check In',Icon: Icon(Icons.lock_open_outlined),),
                     width30,
                MyTextFormFieldWidget(hittext: 'Check Out',Icon: Icon(Icons.lock_outline_rounded),),
                
              ],),
              height20,
         const           Row(children: [
                  width20,
                MyTextFormFieldWidget(hittext: 'Room',Icon: Icon(Icons.bed_outlined),),
                        width30,
                  MyTextFormFieldWidget(hittext: 'Guest',Icon: Icon(Icons.emoji_people),),
              ],),
              height20,
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              width20,
                         Container(
                           height: 55,
                           width: 150,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             border: Border.all(width: 0)
                           ),
                           child: TextButton(onPressed: (){}, child: Text('Cancel'))),
                           width30,
                           Container(
                           height: 55,
                           width: 150,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             border: Border.all(width: 0)
                           ),
                           child: TextButton(onPressed: (){}, child: Text('Apply'))),
                        
              ],),
            ],
          ),
        )
      ),
    ),
  );
}

