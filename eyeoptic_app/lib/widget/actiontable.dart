import 'package:eyeoptic_app/theme/colors.dart';
import 'package:flutter/material.dart';

class ActionTable extends StatelessWidget {
  final String name;
  const ActionTable({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    Color color =
        (name.toLowerCase() == 'edit') ? AppColor.primaryColor : Colors.red;
    IconData iconData = (name.toLowerCase() == 'edit')
        ? Icons.edit_outlined
        : Icons.delete_outline;

    Color bgColor = (name.toLowerCase() == 'edit')
        ? AppColor.editBgColor
        : AppColor.deleteBgColor;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          )),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            iconData,
            color: color,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  color: color,
                ),
          )
        ],
      ),
    );
  }
}
