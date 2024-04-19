import 'package:flutter/material.dart';

class EditServiceTab extends StatelessWidget {
  final String serviceID;
  const EditServiceTab({
    super.key,
    required this.serviceID,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(serviceID),
      ],
    );
  }
}
