import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speat_time_user/controller/singup/authentication_repository.dart';
import 'package:speat_time_user/view/welcome/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp( );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   final  AuthenticationController  AuthController = AuthenticationController();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
         initialRoute: '/',
      getPages: [
        // AuthController.user.value==null?
        GetPage(name: '/', page: ()=>WelcomeScreen())
// :GetPage(name: '/', page: ()=>HomeScreen())
       

       



      ]
    );
  }
} 


 
