import 'package:eyeoptic_app/provider/servicetabprovider.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:eyeoptic_app/widget/addcancelwidget.dart';
import 'package:eyeoptic_app/widget/iconwithtext.dart';
import 'package:eyeoptic_app/widget/outlinebutton.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddService extends StatelessWidget {
  const AddService({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leftSidePanel(context),
        iconPanel(context),
      ],
    );
  }

  Widget leftSidePanel(context) {
    var provider = Provider.of<ServiceTabProvider>(context, listen: false);
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => provider.toggleDisplay(),
            child: const IconText(
              color: AppColor.textColor,
              title: 'Add Service',
              icon: Icons.arrow_back,
              isHeadlinerText: true,
            ),
          ),
          const SizedBox(height: 25.0),
          CustomField(
            labelTxt: 'Title',
            hint: 'ex: Contact Lens',
            onChange: () {},
          ),
          const SizedBox(height: 8.0),
          CustomField(
            labelTxt: 'Description',
            hint: 'describe what this service',
            onChange: () {},
          ),
          OutlinedIconTextButton(onTap: () {}, text: 'Choose Icon'),
          const SizedBox(height: 8.0),
          const AddCancel()
        ],
      ),
    );
  }

  Widget iconPanel(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Icon',
                style: Theme.of(context).textTheme.headlineMedium),
            const Text('Choose one icon to set in the service icon'),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 5,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: List.generate(
                kServiceIcons.length,
                (index) => Image.asset(
                  'img/service_default_icons/${kServiceIcons[index]}',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Select Icon'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
