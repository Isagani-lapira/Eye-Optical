import 'package:eyeoptic_app/services/auth.dart';
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
  String _emailAdd = '';
  String _password = '';
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
              CustomField(
                labelTxt: AppString.emailTxt,
                hint: AppString.sampleEmailTxt,
                onChange: (email) => _emailAdd = email,
              ),
              CustomField(
                labelTxt: AppString.passTxt,
                hint: '**********',
                onChange: (pass) => _password = pass,
                obscure: true,
              ),
              const SizedBox(height: 25.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                child: TextButton(
                  onPressed: () async {
                    Auth auth = Auth();
                    var data = await auth.signIn(_emailAdd, _password, context);

                    if (data != null) {
                      //redirect to login
                      print('rar');
                    }
                  },
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
