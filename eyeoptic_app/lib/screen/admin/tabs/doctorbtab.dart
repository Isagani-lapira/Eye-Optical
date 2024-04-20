import 'package:eyeoptic_app/provider/doctortabprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorTab extends StatefulWidget {
  const DoctorTab({super.key});

  @override
  State<DoctorTab> createState() => _DoctorTabState();
}

class _DoctorTabState extends State<DoctorTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Provider.of<DoctorTabProvider>(context).displayDoctorSection(),
    );
  }
}
