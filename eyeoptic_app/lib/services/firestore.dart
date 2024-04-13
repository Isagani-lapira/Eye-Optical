import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> serviceStream() =>
      _firestore.collection('services').snapshots();

  Future<void> deleteService(String id, Function(bool) onDeleteResult) async {
    try {
      await _firestore.collection('services').doc(id).delete();
      onDeleteResult(true);
    } catch (e) {
      print(e);
    }

    return onDeleteResult(false);
  }
}
