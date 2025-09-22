import 'package:flutter/material.dart';

import '../../../../core/utils/device_utils.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // around the text
        padding: EdgeInsets.symmetric(
          horizontal: DeviceUtils.getScreenWidth(context) * 0.03,
          vertical: DeviceUtils.getScreenWidth(context) * 0.025,
        ),
        // around the gray container
        margin: EdgeInsets.symmetric(
          horizontal: DeviceUtils.getScreenWidth(context) * 0.03,
          vertical: DeviceUtils.getScreenWidth(context) * 0.02,
        ),
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).colorScheme.secondaryContainer.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: DeviceUtils.getScreenWidth(context) * 0.035,
          ),
        ),
      ),
    );
  }
}
