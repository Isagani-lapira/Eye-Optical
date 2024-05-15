import 'package:eyeoptic_app/model/appointmentmodel.dart';
import 'package:eyeoptic_app/services/appointment.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:eyeoptic_app/widget/doctor/doctorlistappointment.dart';
import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppString.homeDoctorTxt,
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 10.0),
        Expanded(
          child: StreamBuilder(
            stream:
                _appointmentStore.getDoctorAppointment(doctorID, _currentDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: kLoader);
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error occurred'));
              } else {
                var data = snapshot.data!.docs;

                if (data.isEmpty) {
                  return const Text("Don't have any appointment yet");
                }

                List<AppointmentModel> model =
                    AppointmentModel.getAppointmentData(data, _currentDate);

                //order by based on default time slot
                model.sort((a, b) {
                  int indexA = kAllTimeSlots.indexOf(a.time);
                  int indexB = kAllTimeSlots.indexOf(b.time);
                  return indexA.compareTo(indexB);
                });

                return DoctorAppointment(model: model);
              }
            },
          ),
        ),
      ],
    );
  }
}
