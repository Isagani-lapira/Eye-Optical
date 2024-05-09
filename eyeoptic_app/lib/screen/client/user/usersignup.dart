import 'package:eyeoptic_app/widget/timelineprogress/progresstimeline.dart';
import 'package:flutter/material.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({Key? key}) : super(key: key);

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  List<String> timeline = [
    'Personal',
    'Account',
    'Review',
  ];

  @override
  Widget build(BuildContext context) {
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
                  children: timeline.map((item) {
                    bool isLast =
                        (timeline.indexOf(item) == timeline.length - 1);
                    return Row(
                      children: [
                        ProgressTimeline(
                          title: item,
                          isLast: isLast,
                        ),
                        if (!isLast)
                          Container(
                            constraints: const BoxConstraints(maxWidth: 70.0),
                            child: const Divider(thickness: 1.0),
                          ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
