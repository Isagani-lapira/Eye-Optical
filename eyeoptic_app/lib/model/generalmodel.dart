import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:intl/intl.dart';

class GeneralModel {
  //creating a random id
  static String generateID(int length) {
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => kcharacters.codeUnitAt(
        random.nextInt(kcharacters.length),
      ),
    ));
  }

  //timestamp to string
  static String formattedDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }

}
