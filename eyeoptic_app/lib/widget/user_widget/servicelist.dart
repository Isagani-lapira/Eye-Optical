import 'package:eyeoptic_app/model/generalmodel.dart';
import 'package:eyeoptic_app/model/servicemodel.dart';
import 'package:eyeoptic_app/services/firestore.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {
  ServiceTile({super.key});

  final FireStoreService _service = FireStoreService();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: StreamBuilder(
        stream: _service.serviceStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: kLoader);
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Error occur'));
          }

          final data = snapshot.data!.docs;
          List<ServiceModel> model = data
              .map((data) => ServiceModel(
                  id: data.id,
                  name: data['name'],
                  description: data['description'],
                  iconName: data['icon'],
                  date: GeneralModel.formattedDate(data['date_created'])))
              .toList();
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 96.0,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      'img/service_default_icons/${model[index].iconName}',
                      height: 70.0,
                      width: 70.0,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      model[index].name,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
            itemCount: model.length,
          );
        },
      ),
    );
  }
}
