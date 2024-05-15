import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/usermodel.dart';
import 'package:eyeoptic_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserStore extends Auth {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> createUserAccount(
      UserModel model, Function()? onFinished) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: model.emailAddress, password: model.password);

      if (userCredential.user != null) {
        await _firestore.collection('user').add({
          'fname': model.fname,
          'lname': model.lname,
          'address': model.address,
          'contactNo': model.contactNo,
          'gender': model.gender,
          'bday': model.bday,
          'email': model.emailAddress,
        }).then((value) {
          if (onFinished != null) onFinished();
        });
      }
    } catch (e) {
      throw Exception(trimFirebaseMessage(e.toString()));
    }
  }

  Future<String?> getUserName(String email) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('user')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var data = querySnapshot.docs.first.data();
        String fullname = '${data['fname']}, ${data['lname']}';
        return fullname;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
