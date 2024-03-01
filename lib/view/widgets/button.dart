import 'package:flutter/material.dart';
import 'package:speat_time_user/view/widgets/my_text_widget.dart';

class SingupButton extends StatelessWidget {
  const SingupButton({
    super.key,
  
     required this.text,
    required  this.backgroundcolor,

    required   this.titlesize, 
     required  this.fontwidget,
       required this.fontcolor,
       
         this.onaction,
         required this.buttonhight,
       
  });


final String text;
final backgroundcolor;

final double  titlesize;
final fontwidget;
final fontcolor;
final double buttonhight;
final onaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonhight,
        decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(10),
        color: backgroundcolor
      ),
      child: Center(
      
        child: Row(
        //  crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
          InkWell(
            onTap: onaction,
            child: SizedBox(
        
           child: 
          //  authController.loading.value?CircularProgressIndicator(color: Colors.white,):  
        
        MyTextWidgets(title:text, fontsize:titlesize, fontwidget: fontwidget, fontcolor: fontcolor)
            ),
          )
        ],),
      ),
    );
  }
}


