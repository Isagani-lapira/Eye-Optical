import 'package:flutter/material.dart';

TableRow headRow(BuildContext context, List<String> headerRow) {
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
