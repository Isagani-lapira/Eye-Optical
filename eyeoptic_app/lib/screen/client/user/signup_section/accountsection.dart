import 'package:eyeoptic_app/provider/signupprovider.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountSection extends StatefulWidget {
  const AccountSection({super.key});

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  String emailAddress = '';
  String password = '';
  String passVerify = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);
    return ListView(
      children: [
        CustomField(
          labelTxt: 'Email address',
          hint: 'ex: juandc@gmail.com',
          width: 0.90,
          onChange: (value) => emailAddress = value,
        ),
        CustomField(
          labelTxt: 'Password',
          hint: '*****',
          width: 0.90,
          onChange: (value) => password = value,
        ),
        CustomField(
          labelTxt: 'Verify Password',
          hint: '*****',
          width: 0.90,
          onChange: (value) => passVerify = value,
        ),
        const SizedBox(height: 8.0),
        TextButton(
          onPressed: () {
            if (emailAddress.isNotEmpty &&
                password.isNotEmpty &&
                passVerify.isNotEmpty) {
              if (password == passVerify) {
                provider.addAccountDetails(emailAddress, password);
                provider.setCurrentIndex(2);
              }
            }
          },
          child: const Text('Next'),
        ),
        GestureDetector(
          onTap: () => provider.setCurrentIndex(0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.hintColor,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
