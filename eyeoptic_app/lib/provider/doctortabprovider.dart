import 'package:eyeoptic_app/model/doctormodel.dart';
import 'package:eyeoptic_app/screen/admin/tabs/doctor%20content/adddoctor.dart';
import 'package:eyeoptic_app/screen/admin/tabs/doctor%20content/editdoctor.dart';
import 'package:eyeoptic_app/screen/admin/tabs/doctor%20content/maindoctortab.dart';
import 'package:flutter/material.dart';

enum DoctorSection { mainSection, addSection, editSection }

class DoctorTabProvider extends ChangeNotifier {
  DoctorSection _currentSection = DoctorSection.mainSection;
  DoctorModel? _doctorModel;

  //retrieval methods
  DoctorSection get currentSection => _currentSection;
  DoctorModel get model => _doctorModel!;

  bool isDoctorSet() => (_doctorModel != null);

  //setter methods
  //changing doctors tab
  void setDoctorSection(DoctorSection section) {
    _currentSection = section;
    notifyListeners();
  }

  void setDoctorModel(DoctorModel? model) => _doctorModel = model;

  String getDoctorData(String fieldName) {
    switch (fieldName) {
      case 'id':
        return _doctorModel!.id;
      case 'First name':
        return _doctorModel!.fname;
      case 'Last name':
        return _doctorModel!.lname;
      case 'Email address':
        return _doctorModel!.email;
      case 'Contact no.':
        return _doctorModel!.contact;
      case 'Address':
        return _doctorModel!.address;
      case 'Gender':
        return _doctorModel!.gender;
      default:
        return '';
    }
  }

  Widget displayDoctorSection() {
    if (_currentSection == DoctorSection.addSection) {
      return const AddDoctorSection();
    } else if (_currentSection == DoctorSection.editSection) {
      return const EditDoctorSection();
    } else {
      return const StreamDoctorTab();
    }
  }
}
