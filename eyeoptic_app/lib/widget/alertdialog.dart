import 'package:eyeoptic_app/theme/colors.dart';
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
