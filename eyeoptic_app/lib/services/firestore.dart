import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/servicemodel.dart';

class FireStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ServiceModel>> fetchService() async {
    var snapShot = await _firestore.collection('services').get();
    List<ServiceModel> services = snapShot.docs
        .map((service) => ServiceModel(
              name: service['name'],
              description: service['description'],
              date: service['date_created'],
            ))
        .toList();
    return services;
  }
}
