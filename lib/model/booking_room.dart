class BookingModel{
  final String? userId;
  final String checkIn;
  final String checkOut;
  final String roomCount;
  final String guest;
  final String roomId;
final String propertyname;
final List propertyImages;

  BookingModel( {
  required this.propertyname,
  this.userId,
  required this.checkIn,
  required this.checkOut,
  required this.roomCount,
  required this.guest,
  required this.roomId,
 required this.propertyImages,
  
  });
}
