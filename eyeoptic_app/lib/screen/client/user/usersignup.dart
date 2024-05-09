import 'package:eyeoptic_app/provider/signupprovider.dart';
import 'package:eyeoptic_app/screen/client/user/signup_section/accountsection.dart';
import 'package:eyeoptic_app/screen/client/user/signup_section/personalsection.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/widget/timelineprogress/progresstimeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserSignUp extends StatelessWidget {
  UserSignUp({Key? key}) : super(key: key);

  final List<String> _timeline = [
    'Personal',
    'Account',
    'Review',
  ];

  final List<Widget> _section = [
    PersonalSection(),
    const AccountSection(),
    const Text('Review'),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);
    final int currentIndex = provider.currentIndex;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: double.infinity,
                height: 65.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _timeline.map((item) {
                    bool isLast =
                        (_timeline.indexOf(item) == _timeline.length - 1);
                    int index = _timeline.indexOf(item);
                    return Row(
                      children: [
                        ProgressTimeline(
                          title: item,
                          isLast: isLast,
                          isActive: index <= currentIndex,
                        ),
                        if (!isLast)
                          Container(
                            constraints: const BoxConstraints(maxWidth: 70.0),
                            child: Divider(
                              thickness: 1.0,
                              color: (currentIndex > index)
                                  ? AppColor.primaryColor
                                  : null,
                            ),
                          ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: _section[provider.currentIndex],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
