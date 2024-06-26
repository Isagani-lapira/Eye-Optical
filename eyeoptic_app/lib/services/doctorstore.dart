import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/doctormodel.dart';
import 'package:eyeoptic_app/services/appointment.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreDoctor {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  //doctors collection
  Stream<QuerySnapshot> doctorStream() =>
      _firestore.collection('doctors').snapshots();

  Future<void> addDoctor(
      DoctorModel model, String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (credential.user != null) {
        await _firestore.collection('doctors').add({
          'fname': model.fname,
          'lname': model.lname,
          'email': model.email,
          'contact': model.contact,
          'address': model.address,
          'gender': model.gender,
          'joined_date': model.joinedDate,
        });
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<String>> getDoctorID() async {
    List<String> doctorIDs = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('doctors').get();

    for (QueryDocumentSnapshot doc in snapshot.docs) {
      doctorIDs.add(doc.id);
    }

    if (doctorIDs.isEmpty) {
      throw Exception('No doctors available.');
    }

    return doctorIDs;
  }

  Future<String?> getDoctorName(String id) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('doctors').doc(id).get();

      if (snapshot.exists) {
        var data = snapshot.data();
        String fullname = '${data!['fname']}, ${data['lname']}';
        return fullname;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String?> getNextAvailableDoctor(String selectedDate) async {
    AppointmentStore appointmentStore = AppointmentStore();
    List<String> assignedDoctors =
        await appointmentStore.assignedDoctor(selectedDate);
    List<String> allDoctors = await getDoctorID();

    if (allDoctors.isEmpty) {
      throw Exception('No doctors available.');
    }

    // Filter out doctors who are already assigned
    List<String> availableDoctors = allDoctors
        .where((doctorId) => !assignedDoctors.contains(doctorId))
        .toList();

    String nextDoctor = '';

    //all doctors already assigned for the day
    if (availableDoctors.isEmpty) {
      int randomDoctor = Random(0).nextInt(allDoctors.length);
      return allDoctors[randomDoctor];
    } else {
      // Always select the first doctor from the available doctors list
      nextDoctor = availableDoctors[0];
      return nextDoctor;
    }
  }

  Future<void> updateDoctor(String id, DoctorModel model) async {
    try {
      await _firestore.collection('doctors').doc(id).update({
        'fname': model.fname,
        'lname': model.lname,
        'email': model.email,
        'contact': model.contact,
        'address': model.address,
        'gender': model.gender,
        'joined_date': model.joinedDate,
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
