import 'package:eyeoptic_app/provider/servicetabprovider.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:eyeoptic_app/widget/servicestream.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainService extends StatelessWidget {
  const MainService({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ServiceTabProvider>(context, listen: false);
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
            onPressed: () => provider.toggleDisplay(ServiceSection.addservice),
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
    );
  }
}
