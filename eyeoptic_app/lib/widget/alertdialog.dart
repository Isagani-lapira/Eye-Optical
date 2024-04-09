import 'package:flutter/material.dart';

class PopUpDialog extends StatelessWidget {
  final String title;
  final String message;
  const PopUpDialog({super.key, required this.title, required this.message});

  Widget _showDialog(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Okay',
            style: TextStyle(color: Colors.white),
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
