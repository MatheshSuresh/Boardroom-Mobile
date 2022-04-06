class AppUrl {
  static const String baseUrl = 'http://54.147.217.183:3001';
  static const String createUser = '$baseUrl/users/create';
  static const String viewAllUsers = '$baseUrl/users/viewall';
  //table
  static const String viewAllTableBookings = '$baseUrl/booking/viewall';
  static const String createTableBooking = '$baseUrl/booking/create';
  static const String updateTableBooking = '$baseUrl/booking/update';
  //room
  static const String viewAllRoomBookings = '$baseUrl/roombooking/viewall';
  static const String createRoomBooking = '$baseUrl/roombooking/create';
  //history
  static const String viewByEmployee = '$baseUrl/booking/viewbyemployee';
  static const String viewByTime = '$baseUrl/booking/viewbytime';
}
