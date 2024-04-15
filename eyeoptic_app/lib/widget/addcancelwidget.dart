import 'package:eyeoptic_app/theme/colors.dart';
import 'package:flutter/material.dart';

class AddCancel extends StatelessWidget {
  const AddCancel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {},
            child: const Text('Add Service'),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          flex: 1,
          child: TextButton(
            style: Theme.of(context).textButtonTheme.style!.copyWith(
                backgroundColor:
                    const MaterialStatePropertyAll(AppColor.cancelButton)),
            onPressed: () {},
            child: const Text('Cancel'),
          ),
        ),
      ],
    );
  }
}
