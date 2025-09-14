import 'package:flutter/material.dart';

import '../../const/app_colors.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: ColorScheme.dark(
      //---- Main
      primary: AppColors.primary,
      secondary: AppColors.secondary,

      //---- Surface
      surface: AppColors.gray40,
      onSurface: AppColors.primaryText,

      //---- Text
      onPrimary: AppColors.primaryText,
      onSecondary: AppColors.gray50,
      onTertiary: AppColors.gray30,

      //---- container
      primaryContainer: AppColors.gray60,
    ),

    fontFamily: "Inter",
  );
}
