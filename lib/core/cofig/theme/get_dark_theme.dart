import 'package:flutter/material.dart';

import '../../const/app_colors.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,

      surface: AppColors.gray50,
      onSurface: AppColors.primaryText,
      onPrimary: AppColors.primaryText,
      onSecondary: AppColors.primaryText,
    ),

    fontFamily: "Inter",
  );
}
