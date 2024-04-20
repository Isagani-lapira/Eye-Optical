import 'package:eyeoptic_app/screen/admin/tabs/doctor%20content/maindoctortab.dart';
import 'package:flutter/material.dart';

enum DoctorSection { mainSection, addSection, editSection }

class DoctorTabProvider extends ChangeNotifier {
  DoctorSection _currentSection = DoctorSection.mainSection;
  DoctorSection get currentSection => _currentSection;

  //changing doctors tab
  void setDoctorSection(DoctorSection section) {
    _currentSection = section;
    notifyListeners();
  }

  Widget displayDoctorSection() {
    if (_currentSection == DoctorSection.addSection) {
      return const Text('Add section');
    } else if (_currentSection == DoctorSection.editSection) {
      return const Text('edit section');
    } else {
      return const StreamDoctorTab();
    }
  }
}
