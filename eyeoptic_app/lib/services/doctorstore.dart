import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/doctormodel.dart';

class FireStoreDoctor {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //doctors collection
  Stream<QuerySnapshot> doctorStream() =>
      _firestore.collection('doctors').snapshots();

  Future<void> addDoctor(DoctorModel model) async {
    try {
      await _firestore.collection('doctors').add({
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
