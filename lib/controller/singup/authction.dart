import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:speat_time_user/controller/singup/Exption.dart';
import 'package:speat_time_user/view/bottom_navigation/bottom_navigation.dart';
import 'package:speat_time_user/view/welcome/welcome_screen.dart';

class AuthenticationRepositry extends GetxController{
  static AuthenticationRepositry get instance => Get.find();
  final auth = FirebaseAuth.instance;
  late final Rx<User?>firebaseUser;
  

  void onReady(){
    Future.delayed(Duration(seconds: 5));
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser,setInitialScreen);
  }

setInitialScreen(User? user){
  user == null
  ?Get.off(()=> const WelcomeScreen())
  :Get.off(()=> const BottomNavigationBarExample());

}
Future<void>creatUserWithEmailAndPassword(String email ,String password )async{
  try{
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    firebaseUser.value!= null
    ? Get.offAll(const BottomNavigationBarExample())
    : Get.offAll(const WelcomeScreen());


  } on FirebaseAuthException catch(e){
    final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
    'Firebase Auth Exception${ex.message}';
    throw ex;
  }catch (_){
    final ex = SignUpWithEmailAndPasswordFailure();
    'Exception${ex.message}';
    throw ex;
  }

}

}