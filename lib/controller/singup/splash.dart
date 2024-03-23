
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speat_time_user/view/welcome/welcome_screen.dart';

class SplashController extends GetxController{
    String? name;
  String? email;
  String? userId;
  String? token;

getDatas() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  token = pref.getString('token');
  email = pref.getString('email');
  name = pref.getString('name');
  userId = pref.getString('userId'); 

}
@override
  void onInit() {
getDatas();
var d = Duration(seconds: 3);
Future.delayed(d,(){
  checkLoginState();
    super.onInit();
  });

}
  Future<void>checkLoginState() async{
    if(token == null){

   
      Get.to(WelcomeScreen());
    }
    
  }
}