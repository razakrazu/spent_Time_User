class BookingModel{
  final String? userId;
  final String checkIn;
  final String checkOut;
  final String roomCount;
  final String guest;
  final String roomId;
final String propertyname;
// final String city;
// final String state;
// final String propertyPrice;
final List propertyImages;

  BookingModel( {
  required this.propertyname,
  // required this.city,
  // required this.state,
  // required this.propertyPrice,  
   this.userId,
  required this.checkIn,
  required this.checkOut,
  required this.roomCount,
  required this.guest,
  required this.roomId,
 required this.propertyImages,
  
  });
  // Map<String,dynamic>toJson(){
  //   return {
  //     'checkin':checkIn,
  //     'checkout':checkOut,
  //     'roomcount':roomCount,
  //     'guests':guests,
  //     'userId':userId,
  //     'roomId':roomId,
  //     //  'city':city,
      //  'property':propertyname,
  //     //  'propertyprice':propertyPrice,
  //     //  'state':state,
      //  'propertyImages':propertyImage
  //   };

  // }
}
