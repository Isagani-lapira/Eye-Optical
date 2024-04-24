import 'package:eyeoptic_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  final List<String> _gender = ['Male', 'Female', 'Others'];
  late String _selectedGender;
  @override
  void initState() {
    super.initState();
    _selectedGender = _gender[0];
  }

  @override
  Widget build(BuildContext context) {
    void showDialogPopUp(Widget child) {
      double size = MediaQuery.of(context).size.height * 0.30;
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.white,
              height: size,
              padding: const EdgeInsets.all(15.0),
              child: child,
            );
          });
    }

    Widget defaultSelector() {
      return DropdownMenu(
        label: const Text('Gender'),
        dropdownMenuEntries: _gender
            .map<DropdownMenuEntry>(
                (gender) => DropdownMenuEntry(value: gender, label: gender))
            .toList(),
        onSelected: (value) {
          setState(() => _selectedGender = value);
          print(_selectedGender);
        },
      );
    }

    Widget iosSelector() {
      String currentVal = '';
      return GestureDetector(
        onTap: () {
          showDialogPopUp(Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Cancel', style: TextStyle(color: Colors.grey)),
                    const Text('Select your gender'),
                    GestureDetector(
                      onTap: () {
                        setState(() => _selectedGender = currentVal);
                        print(_selectedGender);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 45.0,
                    onSelectedItemChanged: (int index) {
                      currentVal = _gender[index];
                    },
                    children: List.generate(
                      _gender.length,
                      (index) => Center(child: Text(_gender[index])),
                    ),
                  ),
                ),
              ],
            ),
          ));
        },
        child: Container(
          padding: const EdgeInsets.all(15.0),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.borderColor,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_selectedGender),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      );
    }

    Widget showPicker() => (Platform.isIOS) ? iosSelector() : defaultSelector();

    return showPicker();
  }
}
