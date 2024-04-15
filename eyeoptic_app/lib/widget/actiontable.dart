import 'package:eyeoptic_app/theme/colors.dart';
import 'package:flutter/material.dart';

class ActionTable extends StatelessWidget {
  final String name;
  final Function onTap;
  const ActionTable({
    super.key,
    required this.name,
    required this.onTap,
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
    Color overlayColor = (name.toLowerCase() == 'edit')
        ? AppColor.primaryOverlayColor
        : AppColor.deleteOverlayColor;
    return TextButton(
      onPressed: () {
        onTap();
      },
      style: Theme.of(context).textButtonTheme.style!.copyWith(
            backgroundColor: MaterialStatePropertyAll(bgColor),
            overlayColor: MaterialStatePropertyAll(overlayColor),
          ),
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
