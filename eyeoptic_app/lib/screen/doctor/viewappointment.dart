import 'package:eyeoptic_app/model/appointmentmodel.dart';
import 'package:eyeoptic_app/screen/doctor/patientrecord.dart';
import 'package:eyeoptic_app/widget/futuretext.dart';
import 'package:flutter/material.dart';

class ViewAppointment extends StatelessWidget {
  final String serviceId;
  final String uid;
  final String date;
  final String time;
  final String patientEmail;
  const ViewAppointment({
    super.key,
    required this.serviceId,
    required this.uid,
    required this.date,
    required this.time,
    required this.patientEmail,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Appointment",
          style: style.bodyMedium!.copyWith(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureText(
                    futureTxt: AppointmentModel.getServiceName(serviceId),
                    style: style.headlineSmall,
                  ),
                  const SizedBox(height: 8.0),
                  FutureText(
                    futureTxt: AppointmentModel.getServiceDescrip(serviceId),
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    children: [
                      const Text('Patient: '),
                      FutureText(
                        futureTxt:
                            AppointmentModel.getPatientName(patientEmail),
                      ),
                    ],
                  ),
                  Text('Date: $date'),
                  Text('Time: $time'),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PatientRecord();
                  }));
                },
                child: const Text('Add record'))
          ],
        ),
      ),
    );
  }
}
