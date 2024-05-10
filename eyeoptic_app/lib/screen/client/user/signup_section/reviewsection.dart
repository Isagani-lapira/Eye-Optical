import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/provider/signupprovider.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = Theme.of(context).textTheme.labelMedium!;
    var provider = Provider.of<SignupProvider>(context);
    Map<String, dynamic> userData = provider.getuserData;

    Timestamp timestamp = userData['bday'];
    DateTime bday = timestamp.toDate();
    return ListView(
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
        Text('${DateFormat.MMM().format(bday)} ${bday.day}, ${bday.year}'),
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
            onPressed: () {},
            child: const Text('Sign up'),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: Theme.of(context).textButtonTheme.style!.copyWith(
                backgroundColor: const MaterialStatePropertyAll(Colors.white)),
            onPressed: () => provider.setCurrentIndex(1),
            child: const Text('Cancel',
                style: TextStyle(color: AppColor.textColor)),
          ),
        )
      ],
    );
  }
}
