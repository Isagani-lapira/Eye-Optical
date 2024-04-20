import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/servicemodel.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> serviceStream() => _firestore
      .collection('services')
      .orderBy('date_created', descending: true)
      .snapshots();

  Future<void> deleteService(String id, Function(bool) onDeleteResult) async {
    try {
      await _firestore.collection('services').doc(id).delete();
      onDeleteResult(true);
    } catch (e) {
      print(e);
    }

    return onDeleteResult(false);
  }

  Future<void> addService(ServiceModel service) async {
    try {
      DateTime dateTime = DateTime.parse(service.date);
      await _firestore.collection('services').add(<String, dynamic>{
        'name': service.name,
        'description': service.description,
        'icon': service.iconName,
        'date_created': dateTime,
      });
    } catch (e) {
      throw Exception('Error adding service: $e');
    }
  }

  Future<void> updateService(ServiceModel service) async {
    try {
      DateTime dateTime = DateTime.now();
      await _firestore
          .collection('services')
          .doc(service.id)
          .update(<String, dynamic>{
        'name': service.name,
        'description': service.description,
        'icon': service.iconName,
        'date_created': dateTime,
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
