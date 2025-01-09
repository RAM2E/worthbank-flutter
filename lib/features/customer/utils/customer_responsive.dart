import 'package:flutter/material.dart';
import '../../../core/utils/base_responsive.dart';

class CustomerDashboardResponsive extends BaseResponsive {
  // Screen Breakpoints
  static bool isMobile(BuildContext context) => 
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1024;
      
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  // Typography
  static double getHeaderSize(BuildContext context) {
    if (isDesktop(context)) return 28;
    if (isTablet(context)) return 24;
    return 20;
  }

  static double getSubheaderSize(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (isTablet(context)) return 20;
    return 18;
  }

  static double getBodySize(BuildContext context) {
    if (isDesktop(context)) return 16;
    if (isTablet(context)) return 14;
    return 12;
  }

  // Layout Spacing
  static EdgeInsets getScreenPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(32);
    if (isTablet(context)) return const EdgeInsets.all(24);
    return const EdgeInsets.all(16);
  }

  static double getSpacing(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (isTablet(context)) return 20;
    return 16;
  }

  // Card Properties
  static double getCardElevation(BuildContext context) {
    if (isDesktop(context)) return 8;
    if (isTablet(context)) return 6;
    return 4;
  }

  static EdgeInsets getCardPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(32);
    if (isTablet(context)) return const EdgeInsets.all(24);
    return const EdgeInsets.all(16);
  }

  // Button Properties
  static double getButtonHeight(BuildContext context) {
    if (isDesktop(context)) return 56;
    if (isTablet(context)) return 48;
    return 40;
  }

  static double getButtonWidth(BuildContext context) {
    if (isDesktop(context)) return 240;
    if (isTablet(context)) return 200;
    return MediaQuery.of(context).size.width * 0.9;
  }

  static EdgeInsets getButtonPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    if (isTablet(context)) return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  }

  // Icon & Border Properties
  static double getIconSize(BuildContext context) {
    if (isDesktop(context)) return 28;
    if (isTablet(context)) return 24;
    return 20;
  }

  static double getBorderRadius(BuildContext context) {
    if (isDesktop(context)) return 16;
    if (isTablet(context)) return 12;
    return 8;
  }

  // Form Field Properties
  static double getFieldHeight(BuildContext context) {
    if (isDesktop(context)) return 56;
    if (isTablet(context)) return 48;
    return 40;
  }

  static double getFieldWidth(BuildContext context) {
    if (isDesktop(context)) return 480;
    if (isTablet(context)) return 360;
    return MediaQuery.of(context).size.width * 0.9;
  }

  static EdgeInsets getFieldPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(16);
    if (isTablet(context)) return const EdgeInsets.all(12);
    return const EdgeInsets.all(8);
  }

  // Grid Layout
  static int getGridColumns(BuildContext context) {
    if (isDesktop(context)) return 4;
    if (isTablet(context)) return 2;
    return 1;
  }

  static double getGridSpacing(BuildContext context) {
    if (isDesktop(context)) return 32;
    if (isTablet(context)) return 24;
    return 16;
  }
}