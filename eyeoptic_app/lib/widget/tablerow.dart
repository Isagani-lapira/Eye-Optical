import 'package:eyeoptic_app/model/servicemodel.dart';
import 'package:eyeoptic_app/widget/actiontable.dart';
import 'package:flutter/material.dart';

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
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionTable(name: 'Edit'),
                      ActionTable(name: 'Delete'),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
      ],
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
