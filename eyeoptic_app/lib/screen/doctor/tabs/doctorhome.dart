import 'package:eyeoptic_app/model/appointmentmodel.dart';
import 'package:eyeoptic_app/provider/doctorappointmentprovider.dart';
import 'package:eyeoptic_app/services/appointment.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:eyeoptic_app/widget/doctor/doctorlistappointment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorHomeTab extends StatefulWidget {
  const DoctorHomeTab({Key? key}) : super(key: key);

  @override
  State<DoctorHomeTab> createState() => _DoctorHomeTabState();
}

class _DoctorHomeTabState extends State<DoctorHomeTab> {
  final AppointmentStore _appointmentStore = AppointmentStore();
  final String doctorID = 'KDRpRUFQnO97E60vaYAy'; //TODO: To be changed
  final DateTime _time = DateTime.now();
  late final String _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = AppointmentModel.formattedDate(_time.toString());
    fetchData(); // Fetch data when the widget is initialized
  }

  void fetchData() async {
    var provider = Provider.of<DoctorProvider>(context, listen: false);
    var snapshot = await _appointmentStore
        .getDoctorAppointment(doctorID, _currentDate)
        .first;
    var data = snapshot.docs;

    if (data.isEmpty) {
      provider.setModelData([]);
    } else {
      List<AppointmentModel> model = AppointmentModel.getAppointmentData(data);
      provider.setModelData(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DoctorProvider>(context);
    int taskCount = provider.modelCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppString.homeDoctorTxt,
            style: Theme.of(context).textTheme.bodyLarge),
        Text('You have $taskCount appointment today!'),
        const SizedBox(height: 10.0),
        Expanded(
          child: provider.getModel.isEmpty
              ? const Text("Don't have any appointment yet")
              : DoctorAppointment(model: provider.getModel),
        ),
      ],
    );
  }
}
