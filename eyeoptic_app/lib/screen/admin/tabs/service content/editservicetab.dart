import 'package:eyeoptic_app/model/servicemodel.dart';
import 'package:eyeoptic_app/services/firestore.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';

class EditServiceTab extends StatelessWidget {
  final ServiceModel serviceModel;
  const EditServiceTab({
    super.key,
    required this.serviceModel,
  });

  @override
  Widget build(BuildContext context) {
    String title = '';
    String description = '';
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomField(
            labelTxt: 'Title',
            hint: serviceModel.name,
            onChange: (value) => title = value,
          ),
          const SizedBox(height: 8.0),
          CustomField(
            labelTxt: 'Description',
            hint: serviceModel.description,
            onChange: (value) => description = value,
          ),
          TextButton(
              onPressed: () {
                if (title.isNotEmpty && description.isNotEmpty) {
                  FireStoreService fireStoreService = FireStoreService();

                  fireStoreService.updateService(ServiceModel(
                      id: serviceModel.id,
                      name: title,
                      description: description,
                      iconName: serviceModel.iconName,
                      date: serviceModel.date));
                }
              },
              child: Text('Save changes')),
        ],
      ),
    );
  }
}
