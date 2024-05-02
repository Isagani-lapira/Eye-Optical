import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/appointmentmodel.dart';

class AppointmentStore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<String> allTimeSlots = [
    '9:00am',
    '10:00am',
    '11:00am',
    '1:00pm',
    '2:00pm',
    '3:00pm',
    '4:00pm',
    '5:00pm'
  ];
  Stream<List<String>> getAvailableTime(String selectedDate) {
    return _firestore
        .collection('appointment')
        .where('date', isEqualTo: selectedDate)
        .snapshots()
        .map((querySnapshot) {
      List<String> bookedTimeSlots = [];
      querySnapshot.docs.forEach((doc) {
        bookedTimeSlots.add(doc['time']);
      });
      List<String> availableTimeSlots = allTimeSlots
          .where((time) => !bookedTimeSlots.contains(time))
          .toList();

      return availableTimeSlots;
    });
  }

  Future<void> addAppointment(AppointmentModel model,
      {Function()? onFinished}) async {
    try {
      await _firestore.collection('appointment').add({
        'uid': model.uID,
        'serviceid': model.serviceID,
        'date': model.date,
        'time': model.time,
      });

      //callback after finishing the adding
      if (onFinished != null) {
        onFinished();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
