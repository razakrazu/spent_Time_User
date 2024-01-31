class BookingModel{
  final String? id;
  final String checkIn;
  final String checkOut;
  final String roomCount;
  final String guests;

  BookingModel({
   this.id,
  required this.checkIn,
  required this.checkOut,
  required this.roomCount,
  required this.guests,
  });
  Map<String,dynamic>toJson(){
    return {
      'checkin':checkIn,
      'checkout':checkOut,
      'roomcount':roomCount,
      'guests':guests,
    };

  }
}
