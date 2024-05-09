import 'package:eyeoptic_app/theme/colors.dart';
import 'package:flutter/material.dart';

class ProgressTimeline extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isLast;
  const ProgressTimeline({
    super.key,
    required this.title,
    this.isActive = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: (isActive) ? AppColor.primaryColor : AppColor.hintColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Icon(
            (isActive) ? Icons.check : Icons.close,
            color: Colors.white,
            size: 22.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(
            color: (isActive) ? AppColor.primaryColor : AppColor.hintColor,
          ),
        )
      ],
    );
  }
}
