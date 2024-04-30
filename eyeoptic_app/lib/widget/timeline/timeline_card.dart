import 'package:eyeoptic_app/theme/colors.dart';
import 'package:flutter/material.dart';

class TimelineCard extends StatelessWidget {
  final bool isHighlighted;
  const TimelineCard({
    super.key,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    Color primaryColor = (isHighlighted) ? Colors.white : AppColor.textColor;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              '11:35',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8.0),
            Text('PM',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.hintColor, fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(width: 8.0),
        Expanded(
          flex: 1,
          child: Container(
            padding: (isHighlighted)
                ? const EdgeInsets.all(15.0)
                : const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                color: (isHighlighted) ? AppColor.primaryColor : Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Contact Lens', style: TextStyle(color: primaryColor)),
                    Icon(Icons.more_vert, color: primaryColor, size: 24.0),
                  ],
                ),
                const SizedBox(height: 10.0),
                iconCard(context, Icons.date_range_outlined, 'March 08, 2024',
                    primaryColor),
                iconCard(context, Icons.room_outlined, 'Eye Care Center',
                    primaryColor),
                iconCard(context, Icons.health_and_safety,
                    'Brooklyn Williamson', primaryColor),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget iconCard(
      BuildContext context, IconData icondata, String label, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Wrap(
        children: [
          Icon(icondata, color: color, size: 20.0),
          const SizedBox(width: 8.0),
          Text(label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: color)),
        ],
      ),
    );
  }
}
