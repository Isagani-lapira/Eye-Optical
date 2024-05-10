import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/model/doctormodel.dart';
import 'package:eyeoptic_app/model/generalmodel.dart';
import 'package:eyeoptic_app/provider/doctortabprovider.dart';
import 'package:eyeoptic_app/services/doctorstore.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:eyeoptic_app/widget/alertdialog.dart';
import 'package:eyeoptic_app/widget/genderwidget.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorField extends StatefulWidget {
  final bool isEditable;
  const DoctorField({super.key, this.isEditable = false});

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
  int generatedNumber = 0;
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
            ? ListView(
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
                      String fieldName = _fields[index];
                      String fieldValue = '';
                      if (provider.isDoctorSet()) {
                        fieldValue = provider.getDoctorData(fieldName);
                        _values[_valuesKeys[index]] = fieldValue;
                      }
                      return (fieldName == 'Gender')
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: GenderWidget(
                                  onChanged: (gender) =>
                                      _values['gender'] = gender),
                            )
                          : CustomField(
                              labelTxt: fieldName,
                              hint: fieldValue,
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
                        style:
                            Theme.of(context).textButtonTheme.style!.copyWith(
                                    padding: const MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(vertical: 20.0),
                                )),
                        onPressed: () {
                          if (_isComplete(_values)) {
                            //add doctor to the database
                            if (!widget.isEditable) {
                              Random random = Random();
                              int generatedNumber = random.nextInt(98) + 1;
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return PopUpDialog(
                                      title: 'Generated Doctor account',
                                      message:
                                          'Send this to your doctor to be able to access the application: \nEmail: ${_values['email']}\nPassword: ${_values['fname']}$generatedNumber',
                                      onTap: (context) {
                                        Navigator.pop(context);
                                        setState(() => _isLoading = true);
                                        _addDoctor(onFinish: () {
                                          setState(() => _isLoading = false);
                                          provider.setDoctorSection(
                                              DoctorSection.mainSection);
                                        });
                                      },
                                    );
                                  });
                            } else {
                              _updateDoctor(provider.getDoctorData('id'));
                              setState(() => _isLoading = false);
                              provider
                                  .setDoctorSection(DoctorSection.mainSection);
                            }
                          } else {
                            print('not yet');
                          }
                        },
                        child: Text(
                            (!widget.isEditable) ? 'Add' : 'Apply Changes')),
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

  void _addDoctor({Function()? onFinish}) async {
    String email = _values['email'];
    String password = '${_values['fname']}generatedNumber';
    DoctorModel model = DoctorModel(
      fname: _values['fname'],
      id: GeneralModel.generateID(8),
      lname: _values['lname'],
      address: _values['address'],
      contact: _values['contact'],
      email: email,
      gender: _values['gender'],
      joinedDate: Timestamp.now(),
    );
    await _fireStoreDoctor.addDoctor(model, email, password).then((value) {
      if (onFinish != null) onFinish();
    });
  }

  void _updateDoctor(
    String id,
  ) async {
    await _fireStoreDoctor.updateDoctor(
      id,
      DoctorModel(
          fname: _values['fname'],
          id: id,
          lname: _values['lname'],
          address: _values['address'],
          contact: _values['contact'],
          email: _values['email'],
          gender: _values['gender'],
          joinedDate: Timestamp.now()),
    );
  }
}
