// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../const/app_colors.dart';

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: "Inter",
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight, // لازم تضيف اللون ده عندك
    // --- Color Scheme
    colorScheme: ColorScheme.light(
      //---- Main
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.secondaryG,
      //---- Surface
      surface: AppColors.gray10,
      onSurface: AppColors.primaryTextDark,
      //---- Text Color
      onPrimary: AppColors.primaryTextDark,
      onSecondary: AppColors.gray60,
      onTertiary: AppColors.gray70,
      //---- container
      primaryContainer: AppColors.gray20.withOpacity(0.9),
      secondaryContainer: AppColors.gray10,
      tertiaryContainer: AppColors.gray30,
    ),
    // --- Icons Theme
    iconTheme: IconThemeData(
      color: AppColors.gray70.withOpacity(0.9),
      size: 26,
    ),
    // --- Text Theme
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: AppColors.gray80),
      bodyLarge: TextStyle(fontWeight: FontWeight.bold),
      labelMedium: TextStyle(color: AppColors.gray70),
      bodyMedium: TextStyle(
        color: AppColors.gray80,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.gray80,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
