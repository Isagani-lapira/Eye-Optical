import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'dart:math';

import 'package:intl/intl.dart';

class ServiceModel {
  final String id;
  final String name;
  final String description;
  final String iconName;
  final String date;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.iconName,
    required this.date,
  });

  static String generateID(int length) {
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => kcharacters.codeUnitAt(
        random.nextInt(kcharacters.length),
      ),
    ));
  }

  static String formattedDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat('yyy/MMM/dd').format(dateTime);
  }
}
