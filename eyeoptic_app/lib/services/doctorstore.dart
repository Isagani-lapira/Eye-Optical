import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDoctor {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  //doctors collection
  Stream<QuerySnapshot> doctorStream() =>
      _firestore.collection('doctors').snapshots();
}
