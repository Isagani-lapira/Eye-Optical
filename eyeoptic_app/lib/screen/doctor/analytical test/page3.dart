import 'package:eyeoptic_app/provider/record.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrelimExam extends StatefulWidget {
  const PrelimExam({super.key});

  @override
  State<PrelimExam> createState() => _PrelimExamState();
}

class _PrelimExamState extends State<PrelimExam> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        VisualAquity(
            title: 'Unaided Distance V.A.',
            labels: kDistanceVA,
            mapData: MapData.prelim),
        VisualAquity(
            title: 'Unaided Near V.A.',
            labels: kNearVA,
            mapData: MapData.prelim),
        VisualAquity(
            title: 'Pinhole Vision.',
            labels: kPinhole,
            mapData: MapData.prelim),
        CurrentRx(),
        const Pupil(),
        const Motor(),
        const CornealReflex(),
        AlternativeCoverTest(),
        const MobilityTest(),
        PupillaryReflexTest(),
        LeftSection(),
      ],
    );
  }
}

class VisualAquity extends StatelessWidget {
  final List<Map<String, String>> labels;
  final String title;
  final MapData mapData;
  const VisualAquity({
    super.key,
    required this.labels,
    required this.mapData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        ...labels.map((labelData) {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(labelData['label']!),
              ),
              CustomField(
                labelTxt: '',
                hint: '',
                onChange: (String medical) {
                  String key = labelData['key']!;
                  provider.addData(key, medical, mapData);
                },
              )
            ],
          );
        }).toList(),
      ],
    );
  }
}

class CurrentRx extends StatelessWidget {
  CurrentRx({super.key});

  final List<Map<String, String>> currentRxLbl = [
    {
      'label': 'Left (OD)',
      'farKey': 'rxRightFar',
      'nearKey': 'rxRightNear',
    },
    {
      'label': 'Left (OS)',
      'farKey': 'rxLeftFar',
      'nearKey': 'rxLeftNear',
    },
    {
      'label': 'OU',
      'farKey': 'rxOUFar',
      'nearKey': 'rxOUNear',
    }
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('V.A with current Rx'),
        const SizedBox(height: 8.0),
        const Row(
          children: [
            Expanded(child: Text('')),
            Expanded(child: Text('Far')),
            Expanded(child: Text('Near')),
          ],
        ),
        ...currentRxLbl.map((data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(data['label']!)),
              CustomField(
                labelTxt: '',
                hint: '',
                onChange: (String value) {
                  String key = data['farKey']!;
                  provider.addData(key, value, MapData.prelim);
                },
                width: 0.30,
              ),
              const SizedBox(width: 8.0),
              CustomField(
                labelTxt: '',
                hint: '',
                onChange: (String value) {
                  String key = data['nearKey']!;
                  provider.addData(key, value, MapData.prelim);
                },
                width: 0.25,
              )
            ],
          );
        }).toList(),
      ],
    );
  }
}

class Pupil extends StatefulWidget {
  const Pupil({super.key});

  @override
  State<Pupil> createState() => _PupilState();
}

class _PupilState extends State<Pupil> {
  bool _isEyeAligned = false;
  bool _isHeadAbnormal = false;
  bool _isFacetilt = false;
  bool _isHeadtilt = false;
  bool _other = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pupil'),
        const SizedBox(height: 8.0),
        const Row(
          children: [
            Expanded(child: Text('')),
            Expanded(child: Text('Shape')),
            Expanded(child: Text('Diameter')),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: Text('Left (OD)')),
            CustomField(
              labelTxt: '',
              hint: '',
              onChange: (String value) {
                String key = 'pupilRightShape';
                provider.addData(key, value, MapData.prelim);
              },
              width: 0.30,
            ),
            const SizedBox(width: 8.0),
            CustomField(
              labelTxt: '',
              hint: '',
              onChange: (String value) {
                String key = 'pupilRightDia';
                provider.addData(key, value, MapData.prelim);
              },
              width: 0.25,
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: Text('Left (OS)')),
            CustomField(
              labelTxt: '',
              hint: '',
              onChange: (String value) {
                String key = 'pupilLeftShape';
                provider.addData(key, value, MapData.prelim);
              },
              width: 0.30,
            ),
            const SizedBox(width: 8.0),
            CustomField(
              labelTxt: '',
              hint: '',
              onChange: (String value) {
                String key = 'pupilLeftDia';
                provider.addData(key, value, MapData.prelim);
              },
              width: 0.25,
            )
          ],
        ),
        Row(
          children: [
            const Expanded(child: Text('PD')),
            CustomField(
              labelTxt: '',
              hint: '',
              onChange: (String value) {
                String key = 'pd';
                provider.addData(key, value, MapData.prelim);
              },
              width: 0.65,
            )
          ],
        ),
        Row(
          children: [
            const Expanded(child: Text('DE')),
            CustomField(
              labelTxt: '',
              hint: '',
              onChange: (String value) {
                String key = 'de';
                provider.addData(key, value, MapData.prelim);
              },
              width: 0.65,
            )
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Checkbox(
              value: _isEyeAligned,
              onChanged: (value) => setState(() {
                _isEyeAligned = value!;
              }),
            ),
            const Text('Eyes not aligned'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _isHeadAbnormal,
              onChanged: (value) => setState(() {
                _isHeadAbnormal = value!;
              }),
            ),
            const Text('Abnormal Head Posture'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _isFacetilt,
              onChanged: (value) => setState(() {
                _isFacetilt = value!;
              }),
            ),
            const Text('Face Tilt - Direction '),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _isHeadtilt,
              onChanged: (value) => setState(() {
                _isHeadtilt = value!;
              }),
            ),
            const Text('Head Tilt - Direction '),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _other,
              onChanged: (value) => setState(() {
                _other = value!;
              }),
            ),
            const Text('Other Pertinent Observation'),
          ],
        ),
      ],
    );
  }
}

class Motor extends StatelessWidget {
  const Motor({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Motor'),
        const SizedBox(height: 8.0),
        CustomField(
          labelTxt: 'Push-up Amp',
          hint: '',
          width: 0.80,
          onChange: (value) {
            String key = 'pushUpAmp';
            provider.addData(key, value, MapData.prelim);
          },
        ),
        CustomField(
          labelTxt: 'NPC',
          hint: '',
          width: 0.80,
          onChange: (value) {
            String key = 'npc';
            provider.addData(key, value, MapData.prelim);
          },
        ),
      ],
    );
  }
}

class CornealReflex extends StatelessWidget {
  const CornealReflex({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Corneal Reflex Test'),
        Row(
          children: [
            const Expanded(flex: 1, child: Text('Right (OD)')),
            CustomField(
              labelTxt: '',
              hint: '',
              onChange: (value) {
                String key = 'cornealRight';
                provider.addData(key, value, MapData.prelim);
              },
            )
          ],
        ),
        Row(
          children: [
            const Expanded(flex: 1, child: Text('Left (OD)')),
            CustomField(
              labelTxt: '',
              hint: '',
              onChange: (value) {
                String key = 'cornealLeft';
                provider.addData(key, value, MapData.prelim);
              },
            )
          ],
        )
      ],
    );
  }
}

class AlternativeCoverTest extends StatelessWidget {
  AlternativeCoverTest({super.key});

  final List<Map<String, String>> currentRxLbl = [
    {
      'label': 'Far',
      'scKey': 'scFar',
      'ccKey': 'ccFar',
    },
    {
      'label': 'Near',
      'scKey': 'scNear',
      'ccKey': 'ccNear',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Alternative Cover Test'),
        const SizedBox(height: 8.0),
        const Row(
          children: [
            Expanded(child: Text('')),
            Expanded(child: Text('SC')),
            Expanded(child: Text('CC')),
          ],
        ),
        ...currentRxLbl.map((data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(data['label']!)),
              CustomField(
                labelTxt: '',
                hint: '',
                onChange: (String value) {
                  String key = data['scKey']!;
                  provider.addData(key, value, MapData.prelim);
                },
                width: 0.30,
              ),
              const SizedBox(width: 8.0),
              CustomField(
                labelTxt: '',
                hint: '',
                onChange: (String value) {
                  String key = data['ccKey']!;
                  provider.addData(key, value, MapData.prelim);
                },
                width: 0.25,
              )
            ],
          );
        }).toList(),
      ],
    );
  }
}

class MobilityTest extends StatelessWidget {
  const MobilityTest({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Mobility Test'),
        const SizedBox(height: 8.0),
        CustomField(
          labelTxt: 'Smooth Pursuit',
          hint: '',
          width: 0.80,
          onChange: (value) {
            String key = 'smoothPursuit';
            provider.addData(key, value, MapData.prelim);
          },
        ),
        CustomField(
          labelTxt: 'Saccadic',
          hint: '',
          width: 0.80,
          onChange: (value) {
            String key = 'saccadic';
            provider.addData(key, value, MapData.prelim);
          },
        ),
      ],
    );
  }
}

class PupillaryReflexTest extends StatelessWidget {
  PupillaryReflexTest({super.key});

  final List<Map<String, String>> currentRxLbl = [
    {
      'label': 'Right (OD)',
      'dlr': 'rxRightDlr',
      'indirect': 'rxRightIndirect',
      'accom': 'rxRightAccom',
    },
    {
      'label': 'Left (OS)',
      'dlr': 'rxLeftDlr',
      'indirect': 'rxLeftIndirect',
      'accom': 'rxLeftAccom',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pupillary Reflex Test'),
        const SizedBox(height: 8.0),
        const Row(
          children: [
            Expanded(child: Text('')),
            Expanded(child: Text('DLR')),
            Expanded(child: Text('Indirect')),
            Expanded(child: Text('Near')),
          ],
        ),
        ...currentRxLbl.map((data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(data['label']!)),
              CustomField(
                labelTxt: '',
                hint: '',
                onChange: (String value) {
                  String key = data['dlr']!;
                  provider.addData(key, value, MapData.prelim);
                },
                width: 0.20,
              ),
              const SizedBox(width: 8.0),
              CustomField(
                labelTxt: '',
                hint: '',
                onChange: (String value) {
                  String key = data['indirect']!;
                  provider.addData(key, value, MapData.prelim);
                },
                width: 0.20,
              ),
              CustomField(
                labelTxt: '',
                hint: '',
                onChange: (String value) {
                  String key = data['accom']!;
                  provider.addData(key, value, MapData.prelim);
                },
                width: 0.20,
              )
            ],
          );
        }).toList(),
      ],
    );
  }
}

class LeftSection extends StatelessWidget {
  LeftSection({super.key});

  final List<Map<String, String>> _data = [
    {
      'label': 'Swinging Flashlight Test:',
      'rightODKey': 'rightODKeySwinging',
      'leftOSKey': 'leftOSKeySwinging',
    },
    {
      'label': 'Amsler Test',
      'rightODKey': 'rightODKeyAmsler',
      'leftOSKey': 'leftOSKeyAmsler',
    },
    {
      'label': 'Proj Test',
      'rightODKey': 'rightODKeyProj',
      'leftOSKey': 'leftOSKeyProj',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _data.map((e) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              e['label']!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Expanded(flex: 1, child: Text('Right (OD)')),
                CustomField(
                  labelTxt: '',
                  hint: '',
                  onChange: (value) {
                    String key = e['rightODKey']!;
                    provider.addData(key, value, MapData.prelim);
                  },
                )
              ],
            ),
            Row(
              children: [
                const Expanded(flex: 1, child: Text('Left (OS)')),
                CustomField(
                  labelTxt: '',
                  hint: '',
                  onChange: (value) {
                    String key = e['leftOSKey']!;
                    provider.addData(key, value, MapData.prelim);
                  },
                )
              ],
            )
          ],
        );
      }).toList(),
    );
  }
}
