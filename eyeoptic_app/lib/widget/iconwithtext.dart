import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;
  final bool isHeadlinerText;
  const IconText({
    super.key,
    required this.color,
    required this.title,
    required this.icon,
    this.isHeadlinerText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          title,
          style: (isHeadlinerText)
              ? Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: color)
              : Theme.of(context).textTheme.bodyMedium!.copyWith(color: color),
        ),
      ],
    );
  }
}
