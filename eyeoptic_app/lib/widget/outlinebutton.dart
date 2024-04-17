import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/widget/iconwithtext.dart';
import 'package:flutter/material.dart';

class OutlinedIconTextButton extends StatelessWidget {
  final Function onTap;
  final String text;
  const OutlinedIconTextButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      style: Theme.of(context).textButtonTheme.style!.copyWith(
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            side: const MaterialStatePropertyAll(
              BorderSide(
                color: AppColor.primaryColor,
                width: 1.5,
              ),
            ),
          ),
      child: IconText(
        color: AppColor.primaryColor,
        title: text,
        icon: Icons.add,
      ),
    );
  }
}
