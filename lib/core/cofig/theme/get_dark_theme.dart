import 'package:flutter/material.dart';

import '../../const/app_colors.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: "Inter",
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    // --- Color Scheme
    colorScheme: ColorScheme.dark(
      //---- Main
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.secondaryG,
      //---- Surface
      surface: AppColors.gray40,
      onSurface: AppColors.primaryText,
      //---- Text Color
      onPrimary: AppColors.primaryText,
      onSecondary: AppColors.gray50,
      onTertiary: AppColors.gray40,
      //---- container
      primaryContainer: AppColors.gray60.withOpacity(0.7),
      secondaryContainer: AppColors.gray70,
      tertiaryContainer: AppColors.gray30,
    ),
    // --- Icons Theme
    iconTheme: IconThemeData(
      color: AppColors.gray30.withOpacity(0.8),
      size: 26,
    ),
    // --- Text Theme
    textTheme: TextTheme(
      titleMedium: const TextStyle(color: AppColors.gray30),
      bodyLarge: TextStyle(fontWeight: FontWeight.bold),
      labelMedium: TextStyle(color: AppColors.gray30),
      bodyMedium: TextStyle(
        color: AppColors.gray30,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: const TextStyle(color: AppColors.gray30 , fontWeight: FontWeight.w500 )
    ),
  );
}
