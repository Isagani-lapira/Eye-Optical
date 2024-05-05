import 'package:eyeoptic_app/model/appointmentmodel.dart';
import 'package:eyeoptic_app/services/doctorstore.dart';
import 'package:eyeoptic_app/services/firestore.dart';
import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  final FireStoreService _service = FireStoreService();
  final FireStoreDoctor _doctor = FireStoreDoctor();
  List<AppointmentModel> _appointmentModel = [];

  void setAppointmentModel(List<AppointmentModel> model) =>
      _appointmentModel = model;

  void removeAppointment(int index) {
    _appointmentModel.removeAt(index);
    notifyListeners();
  }

  List<AppointmentModel> get model => _appointmentModel;

  String getDate(int index) => _appointmentModel[index].date;
  String getServiceID(int index) => _appointmentModel[index].serviceID;

  //slice the time into two
  Map<String, String> getTime(int index) {
    String timeStr = _appointmentModel[index].time;
    int separator = timeStr.indexOf(':') + 3;
    String time = timeStr.substring(0, separator);
    String meridiem = timeStr.substring(separator);

    return {'time': time, 'meridiem': meridiem};
  }

  Future<String?> getServiceName(String serviceID) async {
    try {
      return await _service.getServiceName(serviceID);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String?> getDoctorName(String doctorId) async {
    return await _doctor.getDoctorName(doctorId);
  }
}
