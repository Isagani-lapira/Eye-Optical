import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyeoptic_app/provider/signupprovider.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/widget/genderwidget.dart';
import 'package:eyeoptic_app/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalSection extends StatefulWidget {
  const PersonalSection({super.key});

  @override
  State<PersonalSection> createState() => _PersonalSectionState();
}

class _PersonalSectionState extends State<PersonalSection> {
  late String fname;
  late String lname;
  late String address;
  late String contactNo;
  late Timestamp bday;
  bool isBdayInitialized = false; //for tracking bday if initialized
  late String gender;
  DateTime selectedDate = DateTime.now();

  //update data based on previous data(if any)
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final data = Provider.of<SignupProvider>(context).getuserData;
    fname = data['fname'] ?? '';
    lname = data['lname'] ?? '';
    address = data['address'] ?? '';
    contactNo = data['contactNo'] ?? '';
    gender = data['gender'] ?? '';
    isBdayInitialized = data['bday'] != null;

    if (data['bday'] != null) {
      bday = data['bday'];
      selectedDate = bday.toDate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);
    return ListView(
      children: [
        CustomField(
          labelTxt: 'First name',
          hint: (fname.isNotEmpty) ? fname : 'ex: Juan',
          width: 0.90,
          onChange: (value) => fname = value,
        ),
        CustomField(
          labelTxt: 'Last name',
          hint: (lname.isNotEmpty) ? lname : 'ex: Dela Cruz',
          width: 0.90,
          onChange: (value) => lname = value,
        ),
        CustomField(
          labelTxt: 'Complete Address',
          hint: (address.isNotEmpty) ? address : 'enter here',
          width: 0.90,
          onChange: (value) => address = value,
        ),
        CustomField(
          labelTxt: 'Contact no.',
          hint: (contactNo.isNotEmpty) ? contactNo : 'ex: 09309490330',
          width: 0.90,
          onChange: (value) => contactNo = value,
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    bday = Timestamp.fromDate(value!);
                    isBdayInitialized = true;
                    setState(() {
                      selectedDate = bday.toDate();
                    });
                  });
                },
                child: ListTile(
                  title: Text(
                    '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_down),
                ),
              ),
            ),
            GenderWidget(onChanged: (value) => gender = value),
          ],
        ),
        const SizedBox(height: 8.0),
        TextButton(
          onPressed: () {
            if (fname.isNotEmpty &&
                lname.isNotEmpty &&
                address.isNotEmpty &&
                contactNo.isNotEmpty &&
                gender.isNotEmpty &&
                isBdayInitialized) {
              provider.updateUserData(
                  fname, lname, address, contactNo, gender, bday);

              provider.setCurrentIndex(1);
            }
          },
          child: const Text('Next'),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.hintColor,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
