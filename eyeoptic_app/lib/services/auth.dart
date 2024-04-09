import 'package:eyeoptic_app/widget/alertdialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  static FirebaseAuth auth = FirebaseAuth.instance;

  Future signIn(String email, String password, context) async {
    UserCredential credential;
    try {
      credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user!;
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return PopUpDialog(title:'Error',message: trimFirebaseMessage(e.toString()));
          });
    }
  }

  //reformat the firebase error code message
  String trimFirebaseMessage(String message) {
    int startIndex = message.indexOf('] ') + 1;
    return message.substring(startIndex);
  }
}
