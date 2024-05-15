import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/generalmodel.dart';
import 'package:eyeoptic_app/model/servicemodel.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> serviceStream() => _firestore
      .collection('services')
      .orderBy('date_created', descending: true)
      .snapshots();

  // get selected service
  Future<ServiceModel?> retrieveServiceData(String name) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('services')
          .where('name', isEqualTo: name)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var data = querySnapshot.docs.first.data();
        var id = querySnapshot.docs.first.id;

        return ServiceModel(
            id: id,
            name: data['name'],
            description: data['description'],
            iconName: data['icon'],
            date: GeneralModel.formattedDate(data['date_created']));
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

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

  Future<String> getServiceName(String serviceID) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('services').doc(serviceID).get();

      if (snapshot.exists) {
        String serviceName = snapshot.data()!['name'];
        return serviceName;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getServiceDescrip(String serviceID) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('services').doc(serviceID).get();

      if (snapshot.exists) {
        String serviceName = snapshot.data()!['description'];
        return serviceName;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
