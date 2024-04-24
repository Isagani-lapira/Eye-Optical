import 'package:eyeoptic_app/provider/doctortabprovider.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/widget/genderwidget.dart';
import 'package:eyeoptic_app/widget/iconwithtext.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorField extends StatefulWidget {
  const DoctorField({super.key});

  @override
  State<DoctorField> createState() => _DoctorFieldState();
}

class _DoctorFieldState extends State<DoctorField> {
  final List<String> _fields = [
    'First name',
    'Last name',
    'Email address',
    'Contact no.',
    'Address',
    'Gender'
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = size.width / 2;

    return Consumer<DoctorTabProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => provider.setDoctorSection(DoctorSection.mainSection),
              child: const IconText(
                color: AppColor.textColor,
                title: 'Add Doctor',
                icon: Icons.arrow_back,
                isHeadlinerText: true,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return (_fields[index] == 'Gender')
                          ? const Align(
                              alignment: Alignment.centerLeft,
                              child: GenderWidget())
                          : CustomField(
                              labelTxt: _fields[index],
                              hint: '',
                              onChange: () {},
                            );
                    }),
                    itemCount: _fields.length,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: Theme.of(context).textButtonTheme.style!.copyWith(
                              padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 20.0),
                          )),
                      onPressed: () {},
                      child: const Text('Add'),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () =>
                          provider.setDoctorSection(DoctorSection.mainSection),
                      style: Theme.of(context).textButtonTheme.style!.copyWith(
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 255, 255, 255)),
                          ),
                      child: const Text('Cancel',
                          style: TextStyle(color: AppColor.textColor)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
