import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/usermodel.dart';
import 'package:eyeoptic_app/provider/signupprovider.dart';
import 'package:eyeoptic_app/services/user.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReviewSection extends StatefulWidget {
  const ReviewSection({super.key});

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  bool _isLoading = false;

  void _updateLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  void _addingNewUser(
      BuildContext context, Map<String, dynamic> userData) async {
    _updateLoading(true);
    UserStore userStore = UserStore();
    try {
      await userStore.createUserAccount(
        UserModel(
            fname: userData['fname'],
            lname: userData['lname'],
            address: userData['address'],
            contactNo: userData['contactNo'],
            bday: userData['bday'],
            gender: userData['gender'],
            emailAddress: userData['email'],
            password: userData['password']),
        () {
          Navigator.pop(context);
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account successfully created'),
              duration: Duration(seconds: 3),
            ),
          );
        },
      );
    } catch (error) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          duration: const Duration(seconds: 3),
        ),
      );
    }

    _updateLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = Theme.of(context).textTheme.labelMedium!;
    var provider = Provider.of<SignupProvider>(context);
    Map<String, dynamic> userData = provider.getuserData;

    Timestamp timestamp = userData['bday'];
    DateTime bday = timestamp.toDate();
    return (!_isLoading)
        ? ListView(
            children: [
              Text('Full name', style: labelStyle),
              Text('${userData['fname']} ${userData['lname']}'),
              const SizedBox(height: 8.0),
              Text('Complete address', style: labelStyle),
              Text('${userData['address']}'),
              const SizedBox(height: 8.0),
              Text('Contact no.', style: labelStyle),
              Text('${userData['contactNo']}'),
              const SizedBox(height: 8.0),
              Text('Birthday', style: labelStyle),
              Text(
                  '${DateFormat.MMM().format(bday)} ${bday.day}, ${bday.year}'),
              const SizedBox(height: 8.0),
              Text('Gender', style: labelStyle),
              Text('${userData['gender']}'),
              const SizedBox(height: 8.0),
              Text('Email address', style: labelStyle),
              Text('${userData['email']}'),
              const SizedBox(height: 8.0),
              Text('Password', style: labelStyle),
              const Text('*******'),
              const SizedBox(height: 15.0),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    _addingNewUser(context, userData);
                  },
                  child: const Text('Sign up'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.white)),
                  onPressed: () => provider.setCurrentIndex(1),
                  child: const Text('Cancel',
                      style: TextStyle(color: AppColor.textColor)),
                ),
              )
            ],
          )
        : const Center(child: kLoader);
  }
}
