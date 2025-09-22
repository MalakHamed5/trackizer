import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/const/app_colors.dart';

class BottomAppIcon extends StatelessWidget {
  const BottomAppIcon({
    super.key,
    required this.currentPage,
    required this.navPage,
    required this.icon,
  });

  final String currentPage;
  final String navPage;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (currentPage != navPage) context.push(navPage);
      },
      icon: Icon(
        icon,
        color:  currentPage == navPage ? Colors.white : AppColors.gray50,
      ),
    );
  }
}
