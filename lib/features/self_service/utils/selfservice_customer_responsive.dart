import 'package:flutter/material.dart';
import '../../../core/utils/base_responsive.dart';

class SelfserviceCustomerResponsive extends BaseResponsive {
  // Screen Detection
  static bool isMobile(BuildContext context) => BaseResponsive.isMobile(context);
  static bool isTablet(BuildContext context) => BaseResponsive.isTablet(context); 
  static bool isDesktop(BuildContext context) => BaseResponsive.isDesktop(context);

  // Container Dimensions
  static double getContainerWidth(BuildContext context) {
    if (isDesktop(context)) return 1200;
    if (isTablet(context)) return 800;
    return MediaQuery.of(context).size.width * 0.9;
  }

  // Typography
  static double getHeadingSize(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (isTablet(context)) return 22;
    return 20;
  }

  static double getBodySize(BuildContext context) {
    if (isDesktop(context)) return 16;
    if (isTablet(context)) return 14;
    return 12;
  }

  static double getLabelSize(BuildContext context) {
    if (isDesktop(context)) return 14;
    if (isTablet(context)) return 12;
    return 10;
  }

  // Card Dimensions
  static double getCardHeight(BuildContext context) {
    if (isDesktop(context)) return 200;
    if (isTablet(context)) return 180;
    return 160;
  }

  static EdgeInsets getCardPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(32);
    if (isTablet(context)) return const EdgeInsets.all(24);
    return const EdgeInsets.all(16);
  }

  static double getBorderRadius(BuildContext context) {
    if (isDesktop(context)) return 16;
    if (isTablet(context)) return 12;
    return 8;
  }

  // Button Dimensions  
  static double getButtonHeight(BuildContext context) {
    if (isDesktop(context)) return 48;
    if (isTablet(context)) return 44;
    return 40;
  }

  static double getButtonWidth(BuildContext context) {
    if (isDesktop(context)) return 200;
    if (isTablet(context)) return 180;
    return 160;
  }

  static EdgeInsets getButtonPadding(BuildContext context) {
    if (isDesktop(context)) 
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    if (isTablet(context))
      return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  }

  // Spacing
  static double getSpacing(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (isTablet(context)) return 20;
    return 16;
  }

  static EdgeInsets getPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(32);
    if (isTablet(context)) return const EdgeInsets.all(24);
    return const EdgeInsets.all(16);
  }

  // Grid Layout
  static int getGridCrossAxisCount(BuildContext context) {
    if (isDesktop(context)) return 3;
    if (isTablet(context)) return 2;
    return 1;
  }

  // Form Fields
  static double getFieldHeight(BuildContext context) {
    if (isDesktop(context)) return 56;
    if (isTablet(context)) return 48;
    return 40;
  }

  static double getIconSize(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (isTablet(context)) return 22;
    return 20;
  }
}