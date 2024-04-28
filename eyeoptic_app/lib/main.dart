import 'package:eyeoptic_app/screen/admin/homescreen.dart';
import 'package:eyeoptic_app/screen/admin/loginscreen.dart';
import 'package:eyeoptic_app/screen/user/userhome.dart';
import 'package:eyeoptic_app/theme/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      home: const UserHomeScreen(),
    );
  }
}
