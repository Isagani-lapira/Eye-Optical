import 'package:eyeoptic_app/widget/futuretext.dart';
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

class IconCard extends StatelessWidget {
  final BuildContext context;
  final IconData icondata;
  final Color color;
  final Future<String?>? futureText;
  final String? label;
  const IconCard({
    super.key,
    required this.context,
    required this.icondata,
    required this.color,
    this.futureText,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle =
        Theme.of(context).textTheme.bodySmall!.copyWith(color: color);
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Wrap(
        children: [
          Icon(icondata, color: color, size: 20.0),
          const SizedBox(width: 8.0),
          if (futureText == null) ...[
            Text(label!, style: defaultStyle)
          ] else ...[
            FutureText(futureTxt: futureText!, style: defaultStyle)
          ],
        ],
      ),
    );
  }
}
