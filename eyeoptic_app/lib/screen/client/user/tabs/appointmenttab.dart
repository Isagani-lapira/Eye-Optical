import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:eyeoptic_app/widget/timeline/timeline_card.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class AppointmentTab extends StatefulWidget {
  const AppointmentTab({super.key});

  @override
  State<AppointmentTab> createState() => _AppointmentTabState();
}

class _AppointmentTabState extends State<AppointmentTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Appointment',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12.0),
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColor.primaryColor,
          height: 100.0,
          onDateChange: (selectedDate) => print(selectedDate),
        ),
        Expanded(
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
            child: const NoAppointment(),
          ),
        )
      ],
    );
  }
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
    return Column(
      children: [
        const Row(
            children: [Text('Time'), SizedBox(width: 12.0), Text('Course')]),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 10.0),
            children: const [
              TimelineCard(isHighlighted: true),
              SizedBox(height: 14.0),
              TimelineCard(),
              SizedBox(height: 8.0),
              TimelineCard(),
              SizedBox(height: 8.0),
            ],
          ),
        )
      ],
    );
  }
}
