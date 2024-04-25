import 'package:eyeoptic_app/provider/doctortabprovider.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/widget/doctorfield.dart';
import 'package:eyeoptic_app/widget/iconwithtext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditDoctorSection extends StatelessWidget {
  const EditDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorTabProvider>(builder: (
      BuildContext context,
      DoctorTabProvider provider,
      Widget? _,
    ) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => provider.setDoctorSection(DoctorSection.mainSection),
            child: const IconText(
              color: AppColor.textColor,
              title: 'Edit doctor',
              icon: Icons.arrow_back,
              isHeadlinerText: true,
            ),
          ),
          const Expanded(
              child: DoctorField(
            isEditable: true,
          ))
        ],
      );
    });
  }
}
