import 'package:eyeoptic_app/model/appointmentmodel.dart';
import 'package:eyeoptic_app/widget/futuretext.dart';
import 'package:flutter/material.dart';

class DoctorAppointment extends StatelessWidget {
  final List<AppointmentModel> model;
  const DoctorAppointment({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        AppointmentModel data = model[index];
        return Column(
          children: [
            ListTile(
              title: FutureText(
                futureTxt: AppointmentModel.getServiceName(
                  data.serviceID,
                ),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date: ${data.date}'),
                  Text('Time: ${data.time}'),
                ],
              ),
              trailing: TextButton(onPressed: () {}, child: const Text('View')),
            ),
            const Divider(),
          ],
        );
      },
      itemCount: model.length,
    );
  }
}
