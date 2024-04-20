import 'package:eyeoptic_app/model/servicemodel.dart';
import 'package:eyeoptic_app/provider/servicetabprovider.dart';
import 'package:eyeoptic_app/services/firestore.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/widget/iconwithtext.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditServiceTab extends StatelessWidget {
  final ServiceModel serviceModel;
  const EditServiceTab({
    super.key,
    required this.serviceModel,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ServiceTabProvider>(context, listen: false);
    String title = '';
    String description = '';
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => provider.toggleDisplay(ServiceSection.mainservice),
              child: const IconText(
                title: 'Edit service',
                color: AppColor.textColor,
                icon: Icons.arrow_back,
                isHeadlinerText: true,
              ),
            ),
          ),
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: TextButton(
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
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            width: MediaQuery.of(context).size.width * 0.4,
            child: TextButton(
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColor.cancelButton)),
              onPressed: () =>
                  provider.toggleDisplay(ServiceSection.mainservice),
              child: const Text('Cancel'),
            ),
          ),
        ],
      ),
    );
  }
}
