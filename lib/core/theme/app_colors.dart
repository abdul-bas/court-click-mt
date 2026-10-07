


import 'package:flutter/material.dart';

class AppColors {

  // Brand
  static const Color netflixRed = Color(0xFFE50914);
  static const Color netflixRedDark = Color(0xFFB20710);

  // Backgrounds
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF141414);
  static const Color surfaceElevated = Color(0xFF2F2F2F);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color textMuted = Color(0xFF808080);

  // Buttons
  static const Color buttonPrimary = Color(0xFF0071EB);    
  static const Color buttonSecondary = Color(0xFF333333); 
  // Profile avatars
  static const Color avatarBlue = Color(0xFF1A73E8);
  static const Color avatarYellow = Color(0xFFF5B800);
  static const Color avatarRed = Color(0xFFE50914);

  // Kids avatar gradient
  static const LinearGradient kidsGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1A73E8),       Color(0xFF2EB67D),      Color(0xFFF5A623),
      Color(0xFF8E44AD),    ],
  );
}