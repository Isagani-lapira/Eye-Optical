import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fname;
  final String lname;
  final String address;
  final String contactNo;
  final Timestamp bday;
  final String gender;
  final String emailAddress;
  final String password;
  UserModel({
    required this.fname,
    required this.lname,
    required this.address,
    required this.contactNo,
    required this.bday,
    required this.gender,
    required this.emailAddress,
    required this.password,
    this.id,
  });

}
