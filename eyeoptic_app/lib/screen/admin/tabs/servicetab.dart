import 'package:eyeoptic_app/utils/string.dart';
import 'package:eyeoptic_app/widget/servicestream.dart';
import 'package:flutter/material.dart';

class ServiceTab extends StatefulWidget {
  const ServiceTab({super.key});

  @override
  State<ServiceTab> createState() => _ServiceTabState();
}

class _ServiceTabState extends State<ServiceTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
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
          Expanded(child: ServiceStream())
        ],
      ),
    );
  }
}
