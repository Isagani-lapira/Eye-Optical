import 'package:eyeoptic_app/provider/appointmentprovider.dart';
import 'package:eyeoptic_app/widget/timeline/timeline_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentTileList extends StatelessWidget {
  const AppointmentTileList({super.key});

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
