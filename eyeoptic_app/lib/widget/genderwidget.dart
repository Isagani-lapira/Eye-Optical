import 'package:eyeoptic_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class GenderWidget extends StatefulWidget {
  final Function? onChanged;
  const GenderWidget({super.key, this.onChanged});

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
    //for cupertino display a dialog picker
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

    //non-ios picker
    Widget defaultSelector() {
      return DropdownMenu(
        label: const Text('Gender'),
        dropdownMenuEntries: _gender
            .map<DropdownMenuEntry>(
                (gender) => DropdownMenuEntry(value: gender, label: gender))
            .toList(),
        onSelected: (value) => widget.onChanged!(value),
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
                        //update the value of the ios picker design
                        setState(() => _selectedGender = currentVal);
                        widget.onChanged!(_selectedGender);
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

    //platform dependent
    Widget showPicker() => (Platform.isIOS) ? iosSelector() : defaultSelector();

    return showPicker();
  }
}
