import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/doctormodel.dart';
import 'package:eyeoptic_app/model/generalmodel.dart';
import 'package:eyeoptic_app/provider/doctortabprovider.dart';
import 'package:eyeoptic_app/services/doctorstore.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/const.dart';
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

  late Map<String, dynamic> _values;
  late List<String> _valuesKeys;
  late FireStoreDoctor _fireStoreDoctor;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _values = {
      'fname': '',
      'lname': '',
      'email': '',
      'contact': '',
      'address': '',
      'gender': '',
    };

    _valuesKeys = _values.keys.toList();
    _fireStoreDoctor = FireStoreDoctor();
  }

  bool _isComplete(Map<String, dynamic> map) {
    return map.values.every((value) => value != '');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = size.width / 2;

    return Consumer<DoctorTabProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return (!_isLoading)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () =>
                        provider.setDoctorSection(DoctorSection.mainSection),
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: (itemWidth / itemHeight),
                          ),
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            return (_fields[index] == 'Gender')
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: GenderWidget(
                                        onChanged: (gender) =>
                                            _values['gender'] = gender),
                                  )
                                : CustomField(
                                    labelTxt: _fields[index],
                                    hint: '',
                                    onChange: (value) {
                                      _values[_valuesKeys[index]] = value;
                                    },
                                  );
                          }),
                          itemCount: _fields.length,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: Theme.of(context)
                                .textButtonTheme
                                .style!
                                .copyWith(
                                    padding: const MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(vertical: 20.0),
                                )),
                            onPressed: () async {
                              if (_isComplete(_values)) {
                                setState(() => _isLoading = true);
                                //add doctor to the database
                                await _fireStoreDoctor.addDoctor(DoctorModel(
                                  fname: _values['fname'],
                                  id: GeneralModel.generateID(8),
                                  lname: _values['lname'],
                                  address: _values['address'],
                                  contact: _values['contact'],
                                  email: _values['email'],
                                  gender: _values['gender'],
                                  joinedDate: Timestamp.now(),
                                ));

                                setState(() => _isLoading = false);
                                provider.setDoctorSection(
                                    DoctorSection.mainSection);
                              } else {
                                print('not yet');
                              }
                            },
                            child: const Text('Add'),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () => provider
                                .setDoctorSection(DoctorSection.mainSection),
                            style: Theme.of(context)
                                .textButtonTheme
                                .style!
                                .copyWith(
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
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
              )
            : const Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kLoader,
                  SizedBox(height: 8.0),
                  Text('Adding new doctor'),
                ],
              ));
      },
    );
  }
}
