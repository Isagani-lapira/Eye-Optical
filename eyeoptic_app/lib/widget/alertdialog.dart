import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/const.dart';
import 'package:flutter/material.dart';

class PopUpDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function(BuildContext) onTap;
  final String positiveButton;
  const PopUpDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onTap,
    this.positiveButton = 'Okay',
  });

  Widget _showDialog(BuildContext context) {
    Color positiveButtonbg = (positiveButton.toLowerCase() != 'delete')
        ? AppColor.primaryColor
        : Colors.red;
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          style: Theme.of(context).textButtonTheme.style!.copyWith(
                backgroundColor: MaterialStatePropertyAll(positiveButtonbg),
              ),
          onPressed: () {
            onTap(context);
          },
          child: Text(
            positiveButton,
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _showDialog(context);
  }
}

class IconAlert extends StatefulWidget {
  final Function onPositiveSelected;
  const IconAlert({super.key, required this.onPositiveSelected});

  @override
  State<IconAlert> createState() => _IconAlertState();
}

class _IconAlertState extends State<IconAlert> {
  late String selectedIcon;
  int selectedIconIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select Icon',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.40,
        width: MediaQuery.of(context).size.width * 0.50,
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 5,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: List.generate(
                kServiceIcons.length,
                (index) {
                  return serviceIcon(index);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: Theme.of(context).textButtonTheme.style!.copyWith(
                        backgroundColor: const MaterialStatePropertyAll(
                            AppColor.cancelButton),
                      ),
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8.0),
                TextButton(
                    onPressed: () {
                      widget.onPositiveSelected(selectedIcon);
                      Navigator.pop(context);
                    },
                    child: const Text('Select icon')),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget serviceIcon(int index) {
    bool isSelected = selectedIconIndex == index;
    return GestureDetector(
      onTap: () {
        // update the selected icon
        setState(() {
          selectedIconIndex = index;
        });
        selectedIcon = kServiceIcons[index]; //get current selected icon name
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppColor.primaryColor : Colors.transparent,
              width: 2.5,
            ),
            shape: BoxShape.circle),
        child: Image.asset(
          'img/service_default_icons/${kServiceIcons[index]}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
