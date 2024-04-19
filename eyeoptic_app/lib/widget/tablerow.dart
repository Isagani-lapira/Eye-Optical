import 'package:eyeoptic_app/model/servicemodel.dart';
import 'package:eyeoptic_app/provider/servicetabprovider.dart';
import 'package:eyeoptic_app/services/firestore.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:eyeoptic_app/widget/actiontable.dart';
import 'package:eyeoptic_app/widget/alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceTable extends StatelessWidget {
  final List<String> headerRow;
  final List<ServiceModel>? bodyData;
  const ServiceTable({
    super.key,
    required this.headerRow,
    this.bodyData,
  });

  @override
  Widget build(BuildContext context) {
    FireStoreService storeService = FireStoreService();
    return Consumer<ServiceTabProvider>(
      builder: (context, provider, _) {
        return Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            _headRow(context),
            if (bodyData != null)
              ...bodyData!.map((data) {
                return TableRow(
                  children: [
                    tbCell(context, data.name),
                    tbCell(context, data.description),
                    tbCell(context, data.date),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ActionTable(
                            name: 'Edit',
                            onTap: () {
                              provider.setServiceData(ServiceModel(
                                  id: data.id,
                                  name: data.name,
                                  description: data.description,
                                  iconName: data.iconName,
                                  date: data.date));
                              provider.toggleDisplay(
                                ServiceSection.editservice,
                              );
                            },
                          ),
                          const SizedBox(width: 10.0),
                          ActionTable(
                            name: 'Delete',
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return PopUpDialog(
                                      title: AppString.delService,
                                      message: AppString.delServiceSub,
                                      positiveButton: 'Delete',
                                      onTap: (context) {
                                        storeService.deleteService(data.id,
                                            (result) {
                                          if (result) Navigator.pop(context);
                                        });
                                      },
                                    );
                                  });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }).toList(),
          ],
        );
      },
    );
  }

  TableRow _headRow(BuildContext context) {
    return TableRow(
      children: headerRow
          .map(
            (title) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                title.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget tbCell(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).hintColor),
      ),
    );
  }
}
