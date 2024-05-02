import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/appointmentmodel.dart';
import 'package:eyeoptic_app/services/doctorstore.dart';

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
      FireStoreDoctor doctor = FireStoreDoctor();
      String? assignedDoctor = await doctor.getNextAvailableDoctor(model.date);

      if (assignedDoctor != null) {
        await _firestore.collection('appointment').add({
          'uid': model.uID,
          'serviceid': model.serviceID,
          'assigned_doctor': assignedDoctor,
          'date': model.date,
          'time': model.time,
        });
      }

      //callback after finishing the adding
      if (onFinished != null) {
        onFinished();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<String>> assignedDoctor(String selectedDate) async {
    List<String> assignedDoctors = [];

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('appointment')
        .where('date', isEqualTo: selectedDate)
        .get();

    for (QueryDocumentSnapshot doc in snapshot.docs) {
      if (doc.data() != null) {
        String doctorId = doc['assigned_doctor'];
        assignedDoctors.add(doctorId);
      }
    }

    return assignedDoctors;
  }

  Stream<QuerySnapshot> getUserAppointment(String uid, String date) {
    return _firestore
        .collection('appointment')
        .where('uid', isEqualTo: uid)
        .where('date', isEqualTo: date)
        .snapshots();
  }
}
