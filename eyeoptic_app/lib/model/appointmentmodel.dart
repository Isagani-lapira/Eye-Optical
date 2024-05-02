class AppointmentModel {
  final String uID;
  final String serviceID;
  final String date;
  final String time;

  AppointmentModel({
    required this.uID,
    required this.serviceID,
    required this.date,
    required this.time,
  });

  static String formattedDate(String date) {
    int spaceIndex = date.indexOf(' ');
    if (spaceIndex >= 0) {
      return date.substring(0, spaceIndex);
    }
    return date;
  }
}
