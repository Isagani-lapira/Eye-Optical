import 'package:eyeoptic_app/provider/record.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProfileSection(),
        VitalSignSection(),
        CurrentRxSection(),
        LensSection(),
      ],
    );
  }
}

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            CustomField(
              labelTxt: 'First Name',
              hint: '',
              onChange: (String fname) {
                String key = "fname";
                provider.addFirstSecData(key, fname);
              },
              width: 0.35,
            ),
            const SizedBox(width: 8.0),
            CustomField(
              labelTxt: 'Last Name',
              hint: '',
              onChange: (String lname) {
                String key = "lname";
                provider.addFirstSecData(key, lname);
              },
              width: 0.35,
            ),
          ],
        ),
        Row(
          children: [
            CustomField(
              labelTxt: 'Age',
              hint: '',
              onChange: (String age) {
                String key = "age";
                provider.addFirstSecData(key, age);
              },
              width: 0.35,
            ),
            const SizedBox(width: 8.0),
            CustomField(
              labelTxt: 'Gender',
              hint: '',
              onChange: (String gender) {
                String key = "gender";
                provider.addFirstSecData(key, gender);
              },
              width: 0.35,
            ),
          ],
        ),
        CustomField(
          labelTxt: 'Contact Number',
          hint: '',
          onChange: (String contact) {
            String key = "contact";
            provider.addFirstSecData(key, contact);
          },
          width: 0.90,
        ),
        CustomField(
          labelTxt: 'Occupation',
          hint: '',
          onChange: (String occupation) {
            String key = "occupation";
            provider.addFirstSecData(key, occupation);
          },
          width: 0.90,
        ),
        CustomField(
          labelTxt: 'Street/Barangay',
          hint: '',
          onChange: (String street) {
            String key = "street";
            provider.addFirstSecData(key, street);
          },
          width: 0.90,
        ),
        CustomField(
          labelTxt: 'Municipality',
          hint: '',
          onChange: (String municipality) {
            String key = "municipality";
            provider.addFirstSecData(key, municipality);
          },
          width: 0.90,
        ),
      ],
    );
  }
}

class VitalSignSection extends StatefulWidget {
  const VitalSignSection({super.key});

  @override
  State<VitalSignSection> createState() => _VitalSignSectionState();
}

class _VitalSignSectionState extends State<VitalSignSection> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Vital Sign'),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Blood Pressure'),
            ),
            CustomField(
              labelTxt: 'SYS',
              hint: '',
              onChange: (String sys) {
                String key = "sys";
                provider.addFirstSecData(key, sys);
              },
              width: 0.20,
            ),
            const SizedBox(width: 5.0),
            CustomField(
              labelTxt: 'DIA',
              hint: '',
              onChange: (String dia) {
                String key = "dia";
                provider.addFirstSecData(key, dia);
              },
              width: 0.20,
            ),
          ],
        ),
        CustomField(
          labelTxt: 'Repository Rate',
          hint: '',
          width: 0.90,
          onChange: (String rate) {
            String key = "rate";
            provider.addFirstSecData(key, rate);
          },
        ),
        CustomField(
          labelTxt: 'Pulse Rate',
          hint: '',
          width: 0.90,
          onChange: (String pulse) {
            String key = "pulse";
            provider.addFirstSecData(key, pulse);
          },
        ),
      ],
    );
  }
}

class CurrentRxSection extends StatefulWidget {
  const CurrentRxSection({super.key});

  @override
  State<CurrentRxSection> createState() => _CurrentRxSectionState();
}

class _CurrentRxSectionState extends State<CurrentRxSection> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Vital Sign'),
        const SizedBox(height: 8.0),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('Right (OD)'),
            ),
            CustomField(
              labelTxt: 'SPH',
              hint: '',
              onChange: (String rightODSPH) {
                String key = "rightODSPH";
                provider.addFirstSecData(key, rightODSPH);
              },
              width: 0.20,
            ),
            const SizedBox(width: 5.0),
            CustomField(
              labelTxt: 'CYL',
              hint: '',
              onChange: (String rightCYL) {
                String key = "rightCYL";
                provider.addFirstSecData(key, rightCYL);
              },
              width: 0.20,
            ),
            const SizedBox(width: 5.0),
            CustomField(
              labelTxt: 'ADD',
              hint: '',
              onChange: (String rightAdd) {
                String key = "rightAdd";
                provider.addFirstSecData(key, rightAdd);
              },
              width: 0.20,
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('LEFT (OD)'),
            ),
            CustomField(
              labelTxt: 'SPH',
              hint: '',
              onChange: (String leftSPH) {
                String key = "leftSPH";
                provider.addFirstSecData(key, leftSPH);
              },
              width: 0.20,
            ),
            const SizedBox(width: 5.0),
            CustomField(
              labelTxt: 'CYL',
              hint: '',
              onChange: (String leftCyl) {
                String key = "leftCyl";
                provider.addFirstSecData(key, leftCyl);
              },
              width: 0.20,
            ),
            const SizedBox(width: 5.0),
            CustomField(
              labelTxt: 'ADD',
              hint: '',
              onChange: (String leftAdd) {
                String key = "leftAdd";
                provider.addFirstSecData(key, leftAdd);
              },
              width: 0.20,
            ),
          ],
        ),
      ],
    );
  }
}

class LensSection extends StatefulWidget {
  const LensSection({super.key});

  @override
  State<LensSection> createState() => _LensSectionState();
}

class _LensSectionState extends State<LensSection> {
  bool isSCLChecked = false;
  bool isGPChecked = false;
  bool isToricChecked = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Lens'),
        const SizedBox(height: 8.0),
        CustomField(
          labelTxt: 'Right (OD)',
          hint: '',
          onChange: (String rightOD) {
            String key = "rightOD";
            provider.addFirstSecData(key, rightOD);
          },
          width: 0.90,
        ),
        CustomField(
          labelTxt: 'Left (OD)',
          hint: '',
          onChange: (String leftOD) {
            String key = "leftOD";
            provider.addFirstSecData(key, leftOD);
          },
          width: 0.90,
        ),
        Row(
          children: [
            const Expanded(flex: 2, child: Text('Type:')),
            Checkbox(
              value: isSCLChecked,
              onChanged: (bool? value) {
                setState(() {
                  isSCLChecked = value ?? false;
                });
              },
            ),
            const Text('SCL'),
            Checkbox(
              value: isGPChecked,
              onChanged: (bool? value) {
                setState(() {
                  isGPChecked = value ?? false;
                });
              },
            ),
            const Text('GP'),
            Checkbox(
              value: isToricChecked,
              onChanged: (bool? value) {
                setState(() {
                  isToricChecked = value ?? false;
                });
              },
            ),
            const Text('Toric'),
          ],
        )
      ],
    );
  }
}
