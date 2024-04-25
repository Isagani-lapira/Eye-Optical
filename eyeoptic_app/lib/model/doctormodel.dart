import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DoctorModel {
  final String id;
  final String fname;
  final String lname;
  final String address;
  final String contact;
  final String email;
  final String gender;
  final Timestamp joinedDate;

  DoctorModel({
    required this.id,
    required this.fname,
    required this.lname,
    required this.address,
    required this.contact,
    required this.email,
    required this.gender,
    required this.joinedDate,
  });

  static String formattedDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }
}
