

class SinguModel{


 final String name;
 final String mail;
 final String  Password;
 
 SinguModel( {
  required this.name,
  required this.mail,
  required this.Password,
 });
Map<String,dynamic> userdatas(){ 
  return{
'name':name,
'Email':mail,
'password':Password
  };
  

}

}