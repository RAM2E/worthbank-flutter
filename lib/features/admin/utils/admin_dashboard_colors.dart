import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AdminDashboardColors {
  // Brand Colors
  static const Color primary = AppColors.primary;
  static const Color primaryDark = Color(0xFF1565C0);
  static const Color accent = Color(0xFF4CAF50);
  static const Color accentDark = Color(0xFF388E3C);

  // Surface Colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF5F5F5);
  static const Color card = Color(0xFFFFFFFF);
  static const Color divider = Color(0xFFE0E0E0);

  // Text Colors
  static const Color textDark = Color(0xFF212121);
  static const Color textGrey = Color(0xFF757575);
  static const Color textLight = Color(0xFFFFFFFF);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFD32F2F);
  static const Color info = Color(0xFF2196F3);

  // Navigation Colors
  static const Color navSelected = primary;
  static const Color navUnselected = textGrey;
  static const Color drawerBg = surface;
  static const Color headerBg = primary;

  // Gradients
  static const List<Color> headerGradient = [
    primary,
    primaryDark,
  ];

  static const List<Color> accentGradient = [
    accent,
    accentDark,
  ];

  // Shadows
  static const Color shadowColor = Color(0x1F000000);
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: shadowColor,
      blurRadius: 6,
      offset: Offset(0, 3),
    ),
  ];
}