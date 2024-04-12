import 'package:eyeoptic_app/model/servicemodel.dart';
import 'package:eyeoptic_app/services/firestore.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:eyeoptic_app/widget/tablerow.dart';
import 'package:flutter/material.dart';

class ServiceTab extends StatefulWidget {
  const ServiceTab({super.key});

  @override
  State<ServiceTab> createState() => _ServiceTabState();
}

class _ServiceTabState extends State<ServiceTab> {
  final List<String> headerText = [
    'Title',
    'Description',
    'Created on',
    'Action'
  ];

  List<ServiceModel> _services = [];
  @override
  void initState() {
    super.initState();
    getServiceData();
  }

  Future<void> getServiceData() async {
    final services = await FireStoreService().fetchService();
    setState(() {
      _services = services;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppString.serviceTxt,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.add),
                Text('Add Service'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        ServiceTable(
          headerRow: headerText,
          bodyData: _services,
        ),
      ],
    );
  }
}
