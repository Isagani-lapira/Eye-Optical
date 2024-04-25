import 'package:eyeoptic_app/screen/admin/homescreen.dart';
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

  bool _isLoading = false;

  void _signInProcessing(BuildContext context) async {
    updateLoading();
    Auth auth = Auth();
    var data = await auth.signIn(_emailAdd, _password, context);

    //sign in successful
    if (data != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen(),
          ));
    }

    updateLoading();
  }

  void updateLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (!_isLoading)
            ? SingleChildScrollView(
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
                        onPressed: () {
                          _signInProcessing(context);
                        },
                        child: Text(
                          AppString.login,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : kLoader,
      ),
    );
  }
}
