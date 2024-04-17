import 'package:flutter/material.dart';

class AddCancel extends StatelessWidget {
  final Function? onPositiveTap;
  final Function? onNegativeTap;
  const AddCancel({
    super.key,
    this.onPositiveTap,
    this.onNegativeTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () => onPositiveTap!(),
            child: const Text('Add Service'),
          ),
          const SizedBox(height: 8.0),
          TextButton(
            style: Theme.of(context).textButtonTheme.style!.copyWith(
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 211, 211, 211))),
            onPressed: () => onNegativeTap!(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
