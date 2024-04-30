import 'package:eyeoptic_app/theme/colors.dart';
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
        ),
        Expanded(
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
            child: Column(
              children: [
                const Row(children: [
                  Text('Time'),
                  SizedBox(width: 12.0),
                  Text('Course')
                ]),
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
            ),
          ),
        )
      ],
    );
  }
}
