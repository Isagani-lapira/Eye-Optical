import 'package:eyeoptic_app/provider/servicetabprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceTab extends StatefulWidget {
  const ServiceTab({super.key});

  @override
  State<ServiceTab> createState() => _ServiceTabState();
}

class _ServiceTabState extends State<ServiceTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Provider.of<ServiceTabProvider>(context).serviceTab(),
    );
  }
}
