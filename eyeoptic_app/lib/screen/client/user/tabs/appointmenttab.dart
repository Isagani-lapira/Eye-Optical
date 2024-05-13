import 'package:eyeoptic_app/model/appointmentmodel.dart';
import 'package:eyeoptic_app/provider/appointmentprovider.dart';
import 'package:eyeoptic_app/services/appointment.dart';
import 'package:eyeoptic_app/services/auth.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:eyeoptic_app/widget/appointment_widget/appointmenttile.dart';
import 'package:eyeoptic_app/widget/appointment_widget/noappointment.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:provider/provider.dart';

class AppointmentTab extends StatefulWidget {
  const AppointmentTab({super.key});

  @override
  State<AppointmentTab> createState() => _AppointmentTabState();
}

class _AppointmentTabState extends State<AppointmentTab> {
  final AppointmentStore _appointmentStore = AppointmentStore();
  final DateTime _initialDate = DateTime.now();
  late String _currentSelectedDate;

  @override
  void initState() {
    super.initState();
    _currentSelectedDate = _initialDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    String uid = Auth.auth.currentUser!.uid;
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppointmentProvider(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Appointment', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12.0),
          DatePicker(
            _initialDate,
            initialSelectedDate: _initialDate,
            selectionColor: AppColor.primaryColor,
            height: 100.0,
            onDateChange: (selectedDate) {
              _currentSelectedDate =
                  AppointmentModel.formattedDate(selectedDate.toString());

              setState(() => _currentSelectedDate);
            },
          ),
          Expanded(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
              child: StreamBuilder(
                stream: _appointmentStore.getUserAppointment(
                    uid, AppointmentModel.formattedDate(_currentSelectedDate)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: kLoader);
                  } else if (!snapshot.hasData) {
                    return const NoAppointment();
                  }

                  var data = snapshot.data!.docs;
                  if (data.isEmpty) {
                    return const NoAppointment();
                  }
                  List<AppointmentModel> appointmentModel =
                      AppointmentModel.getAppointmentData(
                    data,
                    AppointmentModel.formattedDate(_currentSelectedDate),
                  );

                  if (appointmentModel.isEmpty) return const NoAppointment();

                  //order by based on default time slot
                  appointmentModel.sort((a, b) {
                    int indexA = kAllTimeSlots.indexOf(a.time);
                    int indexB = kAllTimeSlots.indexOf(b.time);
                    return indexA.compareTo(indexB);
                  });
                  //set up data for appointment model
                  Provider.of<AppointmentProvider>(context)
                      .setAppointmentModel(appointmentModel);
                  return const AppointmentTileList();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
