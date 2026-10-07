import 'package:court_click/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark =ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.netflixRed,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.netflixRed,
    secondary: AppColors.buttonPrimary,
    surface: AppColors.surface,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.surface,
    selectedItemColor: AppColors.textPrimary,
    unselectedItemColor: AppColors.textSecondary,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColors.textPrimary),
    bodySmall: TextStyle(color: AppColors.textSecondary),
  ),
);
}