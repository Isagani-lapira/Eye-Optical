import 'package:eyeoptic_app/services/doctorstore.dart';
import 'package:eyeoptic_app/services/firestore.dart';
import 'package:intl/intl.dart';

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

  static final FireStoreService _service = FireStoreService();
  static final FireStoreDoctor _doctor = FireStoreDoctor();

  static String formattedDate(String date) {
    int spaceIndex = date.indexOf(' ');
    if (spaceIndex >= 0) {
      return date.substring(0, spaceIndex);
    }
    return date;
  }

  static Future<String?> getServiceName(String serviceID) async {
    try {
      return await _service.getServiceName(serviceID);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String?> getDoctorName(String doctorId) async {
    String? doctorName = await _doctor.getDoctorName(doctorId);
    return 'Dr. $doctorName';
  }

  static List<AppointmentModel> getAppointmentData(var data, String date) {
    List<AppointmentModel> appointmentModel = [];
    DateTime currentTime = DateTime.now();
    String currentDate = AppointmentModel.formattedDate(currentTime.toString());

    bool isToday = currentDate == date;
    for (var appointment in data) {
      String date = formattedStringDate(appointment['date']);
      int appointmentHour = get24HourFormat(appointment['time']);

      AppointmentModel model = AppointmentModel(
        id: appointment.id,
        uID: appointment['uid'],
        serviceID: appointment['serviceid'],
        date: date,
        time: appointment['time'],
        assignedDoctor: appointment['assigned_doctor'],
      );

      //if today's date it will check if the appointment is already done
      if (isToday) {
        if (currentTime.hour <= appointmentHour) appointmentModel.add(model);
      } else {
        appointmentModel.add(model);
      }
    }
    return appointmentModel;
  }

  static int get24HourFormat(String time) {
    int hour = int.parse(time.split(':')[0]);
    String amPm = time.split('00')[1].toLowerCase();
    if (amPm == 'pm' && hour != 12) {
      hour += 12;
    } else if (amPm == 'am' && hour == 12) {
      hour = 0;
    }

    return hour;
  }

  static String formattedStringDate(String date) {
    DateTime inputDate = DateTime.parse(date);
    String formattedDate = DateFormat('MMM dd, yyyy').format(inputDate);
    return formattedDate;
  }
}
