import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/servicemodel.dart';
import 'package:eyeoptic_app/services/firestore.dart';
import 'package:eyeoptic_app/theme/colors.dart';
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

  final FireStoreService _fireStoreService = FireStoreService();

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
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _fireStoreService.serviceStream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                        color: AppColor.primaryColor));
              }
              final services = snapshot.data!.docs;
              List<ServiceModel> data = [];

              for (var service in services) {
                data.add(ServiceModel(
                  id: service.id,
                  name: service['name'],
                  description: service['description'],
                  date: service['date_created'],
                ));
              }

              return ListView(children: [
                ServiceTable(
                  headerRow: headerText,
                  bodyData: data,
                ),
              ]);
            },
          ),
        )
      ],
    );
  }
}
