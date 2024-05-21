import 'package:eyeoptic_app/provider/record.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ObjectiveRefraction extends StatelessWidget {
  const ObjectiveRefraction({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RecordProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'IV. OBJECT REFRACTION',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Static Retinoscopy',
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
              width: 0.25,
              onChange: (value) {
                String key = 'rightRetinoscopyFirst';
                provider.addData(key, value, MapData.refraction);
              },
            ),
            const SizedBox(width: 8.0),
            CustomField(
              labelTxt: '',
              hint: '',
              width: 0.25,
              onChange: (value) {
                String key = 'rightRetinoscopySecond';
                provider.addData(key, value, MapData.refraction);
              },
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(flex: 1, child: Text('Left (OS)')),
            CustomField(
              labelTxt: '',
              hint: '',
              width: 0.25,
              onChange: (value) {
                String key = 'leftRetinoscopyFirst';
                provider.addData(key, value, MapData.refraction);
              },
            ),
            const SizedBox(width: 8.0),
            CustomField(
              labelTxt: '',
              hint: '',
              width: 0.25,
              onChange: (value) {
                String key = 'leftRetinoscopySecond';
                provider.addData(key, value, MapData.refraction);
              },
            ),
          ],
        ),
        Text(
          'Dynamic Retinoscopy at 20',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            const Expanded(flex: 1, child: Text('Right (OD)')),
            CustomField(
              labelTxt: '',
              hint: '',
              width: 0.50,
              onChange: (value) {
                String key = 'rightDynamicRetino';
                provider.addData(key, value, MapData.refraction);
              },
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(flex: 1, child: Text('Left (OS)')),
            CustomField(
              labelTxt: '',
              hint: '',
              width: 0.50,
              onChange: (value) {
                String key = 'leftDynamicRetino';
                provider.addData(key, value, MapData.refraction);
              },
            ),
          ],
        )
      ],
    );
  }
}
