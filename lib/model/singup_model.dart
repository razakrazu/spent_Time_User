
import 'package:cloud_firestore/cloud_firestore.dart';

class SingupModel{
 final String name;
 final String mail;
 final String  password;
 final String? userId;
 
 SingupModel( {
  required this.name,
  required this.mail,  
  required this.password,
    this.userId, 
 });

 

 factory SingupModel.singupData(DocumentSnapshot singDatas){
  return SingupModel(name: singDatas['name'], mail: singDatas['email'], password: singDatas['password'],
  userId: singDatas.id);

 }
 
 Map<String,dynamic>toMap(){
  return {
    // 'userId':userId,
    'email':mail,
    'password':password,
    'name':name
  };
 }
}