import 'package:eyeoptic_app/model/appointmentmodel.dart';
import 'package:flutter/material.dart';

class DoctorProvider extends ChangeNotifier {
  List<AppointmentModel> _model = [];

  void setModelData(List<AppointmentModel> model) {
    _model = model;
    notifyListeners(); // Notify listeners after updating data
  }

  List<AppointmentModel> get getModel => _model;
  int get modelCount => _model.length;
}
