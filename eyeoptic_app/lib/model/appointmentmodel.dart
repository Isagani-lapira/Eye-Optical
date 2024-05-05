class AppointmentModel {
  final String? id;
  final String uID;
  final String serviceID;
  final String date;
  final String time;
  final String? assignedDoctor;

  AppointmentModel({
    required this.uID,
    required this.serviceID,
    required this.date,
    required this.time,
    this.assignedDoctor,
    this.id,
  });

  static String formattedDate(String date) {
    int spaceIndex = date.indexOf(' ');
    if (spaceIndex >= 0) {
      return date.substring(0, spaceIndex);
    }
    return date;
  }
}
