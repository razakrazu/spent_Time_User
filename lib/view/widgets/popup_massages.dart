import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/core/color.dart';

class AllSnacbarMassages extends GetxController{


  successMassage(){
    Get.snackbar('Success', 'Your Booking  Ready',backgroundColor: Color.fromARGB(255, 173, 169, 169),borderColor: Colors.black,borderWidth: 0,colorText: blackColor,);
    
  }
}