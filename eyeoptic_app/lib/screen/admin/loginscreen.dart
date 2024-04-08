import 'package:eyeoptic_app/theme/themes.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';

class LoginAdminScreen extends StatefulWidget {
  const LoginAdminScreen({super.key});

  @override
  State<LoginAdminScreen> createState() => _LoginAdminScreenState();
}

class _LoginAdminScreenState extends State<LoginAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: kLogo),
              Text(
                AppString.login,
                style: AppTheme.themeData.textTheme.headlineLarge,
                textAlign: TextAlign.start,
              ),
              Text('Log in as Admin',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.start),
              kLargeSpaceY,
              const CustomField(
                labelTxt: AppString.emailTxt,
                hint: AppString.sampleEmailTxt,
              ),
              const CustomField(
                labelTxt: AppString.passTxt,
                hint: '**********',
              ),
              const SizedBox(height: 25.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppString.login,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
