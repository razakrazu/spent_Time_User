

class SingupModel{


 final String name;
 final String mail;
 final String  Password;
 final  userId;
 
 SingupModel( {
  required this.name,
  required this.mail,
  required this.Password,
   this.userId, required ,
 });
Map<String,dynamic> userdatas(){ 
  return{
'name':name,
'Email':mail,
'password':Password

  };
  

}

}