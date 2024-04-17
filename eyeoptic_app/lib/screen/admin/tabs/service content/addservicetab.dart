import 'package:eyeoptic_app/provider/servicetabprovider.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/widget/addcancelwidget.dart';
import 'package:eyeoptic_app/widget/alertdialog.dart';
import 'package:eyeoptic_app/widget/iconwithtext.dart';
import 'package:eyeoptic_app/widget/outlinebutton.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  String _serviceName = '';
  String _description = '';
  String _iconName = '';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ServiceTabProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => provider.toggleDisplay(),
                child: const IconText(
                  color: AppColor.textColor,
                  title: 'Add Service',
                  icon: Icons.arrow_back,
                  isHeadlinerText: true,
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            CustomField(
              labelTxt: 'Title',
              hint: 'ex: Contact Lens',
              onChange: (value) => _serviceName = value,
            ),
            const SizedBox(height: 8.0),
            CustomField(
              labelTxt: 'Description',
              hint: 'describe what this service',
              onChange: (value) => _description = value,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
              child: OutlinedIconTextButton(
                  onTap: () => _displayIconSelection(
                      context, (icon) => _iconName = icon),
                  text: 'Choose Icon'),
            ),
            const SizedBox(height: 8.0),
            AddCancel(
              onPositiveTap: () {
                if (_serviceName.isNotEmpty &&
                    _description.isNotEmpty &&
                    _iconName.isNotEmpty) {
                } else
                  print('incomplete');
              },
            )
          ],
        ),
      ),
    );
  }

  void _displayIconSelection(
    BuildContext context,
    Function(String) selectedIcon,
  ) {
    showDialog(
      context: context,
      builder: (c) {
        return IconAlert(
          onPositiveSelected: (icon) => selectedIcon(icon),
        );
      },
    );
  }
}
