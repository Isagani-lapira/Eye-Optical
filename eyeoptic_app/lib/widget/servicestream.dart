import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/generalmodel.dart';
import 'package:eyeoptic_app/model/servicemodel.dart';
import 'package:eyeoptic_app/services/firestore.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/widget/tablerow.dart';
import 'package:flutter/material.dart';

class ServiceStream extends StatelessWidget {
  ServiceStream({super.key});

  final List<String> headerText = [
    'Title',
    'Description',
    'Created on',
    'Action'
  ];

  final FireStoreService _fireStoreService = FireStoreService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStoreService.serviceStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator(color: AppColor.primaryColor));
        }
        final services = snapshot.data!.docs;
        List<ServiceModel> data = [];

        for (var service in services) {
          data.add(ServiceModel(
            id: service.id,
            name: service['name'],
            description: service['description'],
            iconName: service['icon'],
            date: GeneralModel.formattedDate(service['date_created']),
          ));
        }

        return ListView(children: [
          ServiceTable(
            headerRow: headerText,
            bodyData: data,
          ),
        ]);
      },
    );
  }
}
