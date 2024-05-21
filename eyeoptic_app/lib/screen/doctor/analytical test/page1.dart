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
                provider.addData(key, fname, MapData.profile);
              },
              width: 0.35,
            ),
            const SizedBox(width: 8.0),
            CustomField(
              labelTxt: 'Last Name',
              hint: '',
              onChange: (String lname) {
                String key = "lname";
                provider.addData(key, lname, MapData.profile);
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
                provider.addData(key, age, MapData.profile);
              },
              width: 0.35,
            ),
            const SizedBox(width: 8.0),
            CustomField(
              labelTxt: 'Gender',
              hint: '',
              onChange: (String gender) {
                String key = "gender";
                provider.addData(key, gender, MapData.profile);
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
            provider.addData(key, contact, MapData.profile);
          },
          width: 0.90,
        ),
        CustomField(
          labelTxt: 'Occupation',
          hint: '',
          onChange: (String occupation) {
            String key = "occupation";
            provider.addData(key, occupation, MapData.profile);
          },
          width: 0.90,
        ),
        CustomField(
          labelTxt: 'Street/Barangay',
          hint: '',
          onChange: (String street) {
            String key = "street";
            provider.addData(key, street, MapData.profile);
          },
          width: 0.90,
        ),
        CustomField(
          labelTxt: 'Municipality',
          hint: '',
          onChange: (String municipality) {
            String key = "municipality";
            provider.addData(key, municipality, MapData.profile);
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
                provider.addData(key, sys, MapData.profile);
              },
              width: 0.20,
            ),
            const SizedBox(width: 5.0),
            CustomField(
              labelTxt: 'DIA',
              hint: '',
              onChange: (String dia) {
                String key = "dia";
                provider.addData(key, dia, MapData.profile);
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
            provider.addData(key, rate, MapData.profile);
          },
        ),
        CustomField(
          labelTxt: 'Pulse Rate',
          hint: '',
          width: 0.90,
          onChange: (String pulse) {
            String key = "pulse";
            provider.addData(key, pulse, MapData.profile);
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
                provider.addData(key, rightODSPH, MapData.profile);
              },
              width: 0.20,
            ),
            const SizedBox(width: 5.0),
            CustomField(
              labelTxt: 'CYL',
              hint: '',
              onChange: (String rightCYL) {
                String key = "rightCYL";
                provider.addData(key, rightCYL, MapData.profile);
              },
              width: 0.20,
            ),
            const SizedBox(width: 5.0),
            CustomField(
              labelTxt: 'ADD',
              hint: '',
              onChange: (String rightAdd) {
                String key = "rightAdd";
                provider.addData(key, rightAdd, MapData.profile);
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
                provider.addData(key, leftSPH, MapData.profile);
              },
              width: 0.20,
            ),
            const SizedBox(width: 5.0),
            CustomField(
              labelTxt: 'CYL',
              hint: '',
              onChange: (String leftCyl) {
                String key = "leftCyl";
                provider.addData(key, leftCyl, MapData.profile);
              },
              width: 0.20,
            ),
            const SizedBox(width: 5.0),
            CustomField(
              labelTxt: 'ADD',
              hint: '',
              onChange: (String leftAdd) {
                String key = "leftAdd";
                provider.addData(key, leftAdd, MapData.profile);
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
            provider.addData(key, rightOD, MapData.profile);
          },
          width: 0.90,
        ),
        CustomField(
          labelTxt: 'Left (OD)',
          hint: '',
          onChange: (String leftOD) {
            String key = "leftOD";
            provider.addData(key, leftOD, MapData.profile);
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
