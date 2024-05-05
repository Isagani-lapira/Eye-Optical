import 'package:eyeoptic_app/model/appointmentmodel.dart';
import 'package:eyeoptic_app/provider/appointmentprovider.dart';
import 'package:eyeoptic_app/services/appointment.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:eyeoptic_app/widget/timeline/timeline_card.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
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
    String temporaryUid = '9QITXVwEfmWiskBcdDpmka3p44H3'; // TODO: To be change
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
                stream: _appointmentStore.getUserAppointment(temporaryUid,
                    AppointmentModel.formattedDate(_currentSelectedDate)),
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
                  List<AppointmentModel> appointmentModel = [];
                  int currentHour = DateTime.now().hour;

                  for (var appointment in data) {
                    String date = formattedStringDate(appointment['date']);
                    int appointmentHour =
                        int.parse(getHours(appointment['time']));

                    //check if the schedule is already done
                    if (appointmentHour >= currentHour) {
                      appointmentModel.add(
                        AppointmentModel(
                          id: appointment.id,
                          uID: appointment['uid'],
                          serviceID: appointment['serviceid'],
                          date: date,
                          time: appointment['time'],
                          assignedDoctor: appointment['assigned_doctor'],
                        ),
                      );
                    }
                  }

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
                  return const AppointmentTile();
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  String getHours(String time) {
    return time.substring(0, time.indexOf(':'));
  }
}

String formattedStringDate(String date) {
  DateTime inputDate = DateTime.parse(date);
  String formattedDate = DateFormat('MMM dd, yyyy').format(inputDate);
  return formattedDate;
}

class NoAppointment extends StatelessWidget {
  const NoAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'img/user_img/empty.png',
          height: 200.0,
          width: 200.0,
        ),
        Text(AppString.noAppointmentTitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                )),
        const SizedBox(height: 8.0),
        const Text(AppString.noAppointmentDesc, textAlign: TextAlign.center),
        const SizedBox(height: 8.0),
        TextButton(onPressed: () {}, child: const Text('Schedule now!'))
      ],
    );
  }
}

class AppointmentTile extends StatelessWidget {
  const AppointmentTile({super.key});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<AppointmentProvider>(context).model;
    return Column(
      children: [
        const Row(
            children: [Text('Time'), SizedBox(width: 12.0), Text('Course')]),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 10.0),
            itemBuilder: (context, index) {
              bool isHighlighted = index == 0;
              return TimelineCard(isHighlighted: isHighlighted, index: index);
            },
            itemCount: model.length,
          ),
        )
      ],
    );
  }
}
