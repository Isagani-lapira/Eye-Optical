import 'package:eyeoptic_app/provider/record.dart';
import 'package:eyeoptic_app/screen/doctor/analytical%20test/page1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientRecord extends StatefulWidget {
  const PatientRecord({super.key});

  @override
  State<PatientRecord> createState() => _PatientRecordState();
}

class _PatientRecordState extends State<PatientRecord> {
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
          "Patient record",
          style: style.bodyMedium!.copyWith(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        width: double.infinity,
        height: double.infinity,
        child: ChangeNotifierProvider(
          create: (BuildContext context) => RecordProvider(),
          child: const StepperData(),
        ),
      ),
    );
  }
}

class StepperData extends StatefulWidget {
  const StepperData({super.key});

  @override
  State<StepperData> createState() => _StepperDataState();
}

class _StepperDataState extends State<StepperData> {
  int _index = 0;

  final List<Step> _steps = [
    const Step(
      title: Text('Patient\'s Profile'),
      content: PatientProfile(),
    ),
    const Step(
      title: Text('Next'),
      content: Text('next na'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index < _steps.length - 1 && isComplete(_index, provider)) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: _steps,
    );
  }

  bool isComplete(int index, RecordProvider provider) {
    Map<String, String> data;
    data = provider.getFirstSecData;

    switch (index) {
      case 0:
        data = provider.getFirstSecData;
        print(data);
        break;
    }

    return provider.isSectionComplete(data);
  }
}
