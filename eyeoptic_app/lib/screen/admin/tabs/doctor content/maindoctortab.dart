import 'package:eyeoptic_app/provider/doctortabprovider.dart';
import 'package:eyeoptic_app/screen/admin/tabs/doctor%20content/doctorstream.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamDoctorTab extends StatefulWidget {
  const StreamDoctorTab({super.key});

  @override
  State<StreamDoctorTab> createState() => _StreamDoctorTabState();
}

class _StreamDoctorTabState extends State<StreamDoctorTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DoctorTabProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppString.doctorTxt,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () =>
                provider.setDoctorSection(DoctorSection.addSection),
            child: const Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.add),
                Text('Add Doctor'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        Expanded(child: DoctorStream())
      ],
    );
  }
}
