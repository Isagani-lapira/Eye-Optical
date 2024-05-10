import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/usermodel.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier {
  int _currentIndex = 0;
  Map<String, dynamic> _userData = {};
  UserModel? _model;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void addAccountDetails(String email, String password) {
    _userData['email'] = email;
    _userData['password'] = password;
  }

  void updateUserData(String fname, String lname, String address,
      String contactNo, String gender, Timestamp bday) {
    _userData['fname'] = fname;
    _userData['lname'] = lname;
    _userData['address'] = address;
    _userData['contactNo'] = contactNo;
    _userData['gender'] = gender;
    _userData['bday'] = bday;
  }

  void setUserModel(UserModel user) => _model = user;

  int get currentIndex => _currentIndex;
  UserModel get userModel => _model!;
  Map<String, dynamic> get getuserData => _userData;
}
