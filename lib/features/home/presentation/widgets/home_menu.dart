import 'package:flutter/material.dart';

import '../../../../core/const/app_sizes.dart';
import '../../../../core/utils/device_utils.dart';
import '../../../../core/utils/tools.dart';

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
          horizontal: appW * 0.03,
          vertical: appW * 0.025,
        ),
        // around the gray container
        margin: EdgeInsets.symmetric(
          horizontal: appW * 0.03,
          vertical: appW * 0.02,
        ),
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).colorScheme.secondaryContainer.withOpacity(0.4),
          borderRadius: AppSizes.brL,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: appColor.onPrimary, fontSize: appW * 0.035),
        ),
      ),
    );
  }
}
