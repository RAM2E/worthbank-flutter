import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors - Professional Blue Theme
  static const MaterialColor brand = MaterialColor(0xFF2563EB, {
    50: Color(0xFFEFF6FF),
    100: Color(0xFFDBEAFE),
    200: Color(0xFFBFDBFE),
    300: Color(0xFF93C5FD),
    400: Color(0xFF60A5FA),
    500: Color(0xFF2563EB),
    600: Color(0xFF2563EB),
    700: Color(0xFF1D4ED8),
    800: Color(0xFF1E40AF),
    900: Color(0xFF1E3A8A),
  });

  // Primary Theme Colors
  static const Color primary = Color(0xFF673AB7);
  static const Color primaryLight = Color(0xFF9575CD);
  static const Color primaryDark = Color(0xFF311B92);

  // Surface Colors
  static const Color background = Color(0xFFF8FAFC);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceMedium = Color(0xFFF8FAFC);
  static const Color surfaceDark = Color(0xFFF1F5F9);

  // Text Colors
  static const Color textLight = Colors.white;
  static const Color textDark = Color(0xFF0F172A);
  static const Color textGrey = Color(0xFF64748B);
  static const Color textHint = Color(0xFF94A3B8);
  static const Color textSecondary = Color(0xFF8D8E98);
  static const Color textPrimary = Color(0xFFFFFFFF);

  // Status Colors
  static const Color error = Color(0xFFDC2626);
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFD97706);
  static const Color info = Color(0xFF0284C7);

  // Input & Border Colors
  static const Color inputBorder = Color(0xFFCBD5E1);
  static const Color inputFocused = primary;

  // Action Button Colors
  static const Color createButton = Color(0xFF80DEEA);
  static const Color viewButton = Color(0xFF81C784);
  static const Color updateButton = Color(0xFFFFD54F);
  static const Color deleteButton = Color(0xFFEF5350);
  static const Color blockButton = Color(0xFF9575CD);
  static const Color unblockButton = Color(0xFFFFB74D);
  static const Color disabled = Colors.grey;

  // Gradient Colors
  static const List<Color> primaryGradient = [
    primaryLight,
    primary,
    primaryDark,
  ];

  static const List<Color> headerGradient = [
    primary,
    primaryDark,
  ];

  // Chart Colors
  static const List<Color> chartColors = [
    primary,
    createButton,
    viewButton,
    updateButton,
    deleteButton,
    blockButton,
    unblockButton,
  ];
}
