import 'package:eyeoptic_app/screen/client/user/userhome.dart';
import 'package:eyeoptic_app/services/auth.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
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
          builder: (BuildContext context) => const UserHomeScreen(),
        ),
      );
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        AppString.login,
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        'Login to continue',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    kLargeSpaceY,
                    CustomField(
                      labelTxt: AppString.emailTxt,
                      hint: AppString.sampleEmailTxt,
                      onChange: (email) => _emailAdd = email,
                      width: 0.90,
                    ),
                    CustomField(
                      labelTxt: AppString.passTxt,
                      hint: '**********',
                      onChange: (pass) => _password = pass,
                      obscure: true,
                      width: 0.90,
                    ),
                    const SizedBox(height: 25.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
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
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'Create here',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : kLoader,
      ),
    );
  }
}
