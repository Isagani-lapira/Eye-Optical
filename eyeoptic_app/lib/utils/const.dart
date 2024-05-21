import 'package:eyeoptic_app/theme/colors.dart';
import 'package:flutter/material.dart';

const kLogo = AssetImage('img/logo.png');
const SizedBox kLargeSpaceY = SizedBox(height: 25.0);

const List kServiceIcons = [
  'boy.png',
  'brain.png',
  'contact-lens.png',
  'contact-lens2.png',
  'dial.png',
  'eye1.png',
  'eye2.png',
  'eye3.png',
  'infection.png',
  'old.png',
  'visually-impaired.png',
];

const String kcharacters = 'abcdefghijklmnopqrstuvwxyz0123456789';

const CircularProgressIndicator kLoader = CircularProgressIndicator(
  color: AppColor.primaryColor,
);

List<String> kAllTimeSlots = [
  '9:00am',
  '10:00am',
  '11:00am',
  '1:00pm',
  '2:00pm',
  '3:00pm',
  '4:00pm',
  '5:00pm'
];

List<Map<String, String>> kDistanceVA = [
  {
    'label': 'Right (OD)',
    'key': 'dVARight',
  },
  {
    'label': 'Left (OS)',
    'key': 'dVALeft',
  },
  {
    'label': 'OU',
    'key': 'dVAOU',
  }
];

List<Map<String, String>> kNearVA = [
  {
    'label': 'Right (OD)',
    'key': 'nVARight',
  },
  {
    'label': 'Left (OS)',
    'key': 'nVALeft',
  },
  {
    'label': 'OU',
    'key': 'nVAOU',
  }
];

List<Map<String, String>> kPinhole = [
  {
    'label': 'Right (OD)',
    'key': 'pinholeRight',
  },
  {
    'label': 'Left (OS)',
    'key': 'pinholeLeft',
  },
  {
    'label': 'OU',
    'key': 'pinholeOU',
  }
];
