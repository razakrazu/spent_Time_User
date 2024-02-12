import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:speat_time_user/view/bottom_navigation/bottom_navigation.dart';
import 'package:speat_time_user/view/singup/singup_screen.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();


final auth = FirebaseAuth.instance;
late final Rx<User?> firebaseUser;
@override
  void onReady() {
    // TODO: implement onReady
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser,setInitialScreen);
  }
setInitialScreen(User?user){
  user == null ? Get.offAll(()=>SingUpScreen()): Get.offAll(BottomNavigation());
}

Future<void>createUserWithEmailAndPassword(String email, String password)async{

try{
  await auth.createUserWithEmailAndPassword(email: email, password: password);

}on FirebaseAuthException catch(e){

}catch(_){}
}
Future<void>loginWithEmailAndPassword(String email,String password ) async{


  try{
    await auth.signInWithEmailAndPassword(email: email, password: password);

  }on FirebaseAuthException catch(e){

  }catch(_){}
}

Future<void>logout() async => await auth.signOut();
}