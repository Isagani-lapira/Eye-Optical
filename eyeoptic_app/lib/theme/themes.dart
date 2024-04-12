import 'package:eyeoptic_app/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColor.bgColor,
    fontFamily: 'Poppins',
    iconTheme: const IconThemeData(color: AppColor.primaryColor, size: 32.0),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColor.textColor, fontSize: 14.0),
      bodySmall: TextStyle(color: AppColor.textColor, fontSize: 12.0),
      labelMedium: TextStyle(
        color: AppColor.textColor,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: AppColor.textColor),
      headlineMedium: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          color: AppColor.textColor),
    ),
    focusColor: AppColor.primaryColor,
    hintColor: AppColor.hintColor,
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical:10.0,horizontal: 18.0),
          ),
          backgroundColor: MaterialStatePropertyAll(AppColor.primaryColor),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
          )),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.borderColor),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor, width: 1.5),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
    ),
  );
}
