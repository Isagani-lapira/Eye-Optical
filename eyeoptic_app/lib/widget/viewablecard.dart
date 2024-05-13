import 'package:eyeoptic_app/model/appointmentmodel.dart';
import 'package:eyeoptic_app/services/appointment.dart';
import 'package:eyeoptic_app/services/auth.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:eyeoptic_app/widget/appointment_widget/noappointment.dart';
import 'package:eyeoptic_app/widget/futuretext.dart';
import 'package:flutter/material.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  final AppointmentStore _appointmentStore = AppointmentStore();
  final DateTime _time = DateTime.now();
  late String _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = _time.toString();
  }

  @override
  Widget build(BuildContext context) {
    String uid = Auth.auth.currentUser!.uid;
    return Expanded(
      child: StreamBuilder(
        stream: _appointmentStore.getUserAppointment(
            uid, AppointmentModel.formattedDate(_currentDate)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: kLoader);
          } else if (snapshot.hasError) {
            return const Text('Error occur! Try again later',
                textAlign: TextAlign.center);
          } else {
            var data = snapshot.data!.docs;

            if (data.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: NoAppointment(isTxtVersion: true),
              );
            }

            List<AppointmentModel> appointmentModel =
                AppointmentModel.getAppointmentData(
                    data, AppointmentModel.formattedDate(_currentDate));

            if (appointmentModel.isEmpty) {
              return const NoAppointment(isTxtVersion: true);
            }

            //order by based on default time slot
            appointmentModel.sort((a, b) {
              int indexA = kAllTimeSlots.indexOf(a.time);
              int indexB = kAllTimeSlots.indexOf(b.time);
              return indexA.compareTo(indexB);
            });

            return ListView.builder(
              itemBuilder: (context, index) {
                return AppointmentTile(
                  serviceID: appointmentModel[index].serviceID,
                  assignedDoctor: appointmentModel[index].assignedDoctor!,
                  time: appointmentModel[index].time,
                  date: appointmentModel[index].date,
                );
              },
              itemCount: appointmentModel.length,
            );
          }
        },
      ),
    );
  }
}

class AppointmentTile extends StatelessWidget {
  final String serviceID;
  final String assignedDoctor;
  final String date;
  final String time;
  const AppointmentTile({
    super.key,
    required this.serviceID,
    required this.assignedDoctor,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      title: FutureText(
          futureTxt: AppointmentModel.getServiceName(serviceID),
          style: textTheme.labelMedium),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureText(futureTxt: AppointmentModel.getDoctorName(assignedDoctor)),
          Text('Date: $date', style: textTheme.bodySmall),
          Text('Time: $time', style: textTheme.bodySmall),
        ],
      ),
      trailing: TextButton(
        onPressed: () {},
        child: const Text('View'),
      ),
    );
  }
}
