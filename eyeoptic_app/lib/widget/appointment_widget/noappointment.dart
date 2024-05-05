import 'package:eyeoptic_app/utils/string.dart';
import 'package:flutter/material.dart';

class NoAppointment extends StatelessWidget {
  final bool isTxtVersion;
  const NoAppointment({super.key, this.isTxtVersion = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isTxtVersion) ...[
          Image.asset(
            'img/user_img/empty.png',
            height: 200.0,
            width: 200.0,
          ),
          Text(AppString.noAppointmentTitle,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
        ],
        const SizedBox(height: 8.0),
        const Text(AppString.noAppointmentDesc, textAlign: TextAlign.center),
        const SizedBox(height: 8.0),
        TextButton(onPressed: () {}, child: const Text('Schedule now!'))
      ],
    );
  }
}
