import 'package:flutter/material.dart';
import 'app_colors.dart';
import '../utils/base_responsive.dart';

class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      // Colors
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,

      // ColorScheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.primaryLight,
        error: AppColors.error,
        background: AppColors.background,
        surface: AppColors.surfaceLight,
      ),

      // Text Themes
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: BaseResponsive.getHeadingSize(context),
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
        bodyLarge: TextStyle(
          fontSize: BaseResponsive.getBodySize(context),
          color: AppColors.textDark,
        ),
      ),

      // Component Themes
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            BaseResponsive.getBorderRadius(context),
          ),
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            BaseResponsive.getBorderRadius(context),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            BaseResponsive.getBorderRadius(context),
          ),
          borderSide: const BorderSide(
            color: AppColors.inputBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            BaseResponsive.getBorderRadius(context),
          ),
          borderSide: const BorderSide(
            color: AppColors.inputFocused,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            BaseResponsive.getBorderRadius(context),
          ),
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
        contentPadding: BaseResponsive.getPadding(context),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: BaseResponsive.getPadding(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              BaseResponsive.getBorderRadius(context),
            ),
          ),
        ),
      ),
    );
  }
}
