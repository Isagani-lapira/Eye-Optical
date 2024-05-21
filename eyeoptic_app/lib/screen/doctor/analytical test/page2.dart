import 'package:eyeoptic_app/provider/record.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientHistory extends StatefulWidget {
  const PatientHistory({super.key});

  @override
  State<PatientHistory> createState() => _PatientHistoryState();
}

class _PatientHistoryState extends State<PatientHistory> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('II. Patient History'),
        CustomField(
          labelTxt: 'Visual and Ocular',
          hint: '',
          onChange: (String vao) {
            String key = 'vao';
            provider.addData(key, vao, MapData.history);
          },
          width: 0.90,
        ),
        const SizedBox(height: 10.0),
        const Text('Medical'),
        CustomField(
          labelTxt: 'Present Illness',
          hint: '',
          onChange: (String pIllness) {
            String key = 'pIllness';
            provider.addData(key, pIllness, MapData.history);
          },
          width: 0.90,
        ),
        CustomField(
          labelTxt: 'Past History',
          hint: '',
          onChange: (String pastHistory) {
            String key = 'pastHistory';
            provider.addData(key, pastHistory, MapData.history);
          },
          width: 0.90,
        ),
        const SizedBox(height: 10.0),
        const Text('Family History'),
        CustomField(
          labelTxt: 'Ocular',
          hint: '',
          onChange: (String ocular) {
            String key = 'ocular';
            provider.addData(key, ocular, MapData.history);
          },
          width: 0.90,
        ),
        CustomField(
          labelTxt: 'Medical',
          hint: '',
          onChange: (String medical) {
            String key = 'medical';
            provider.addData(key, medical, MapData.history);
          },
          width: 0.90,
        ),
      ],
    );
  }
}
