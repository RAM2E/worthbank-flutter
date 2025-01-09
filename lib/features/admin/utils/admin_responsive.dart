import 'package:flutter/material.dart';
import '../../../core/utils/base_responsive.dart';

class AdminResponsive extends BaseResponsive {
  // Screen Detection (using parent methods)
  static bool isMobile(BuildContext context) => BaseResponsive.isMobile(context);
  static bool isTablet(BuildContext context) => BaseResponsive.isTablet(context);
  static bool isDesktop(BuildContext context) => BaseResponsive.isDesktop(context);

  // Container Dimensions
  static double getLoginContainerWidth(BuildContext context) {
    if (isDesktop(context)) return 480;
    if (isTablet(context)) return MediaQuery.of(context).size.width * 0.6;
    return MediaQuery.of(context).size.width * 0.9;
  }

  static double getDrawerWidth(BuildContext context) {
    if (isDesktop(context)) return 250;
    if (isTablet(context)) return 220;
    return MediaQuery.of(context).size.width * 0.7;
  }

  // Navigation Dimensions
  static double getNavBarHeight(BuildContext context) {
    if (isDesktop(context)) return 60;
    if (isTablet(context)) return 56;
    return 48;
  }

  static double getAppBarHeight(BuildContext context) {
    if (isDesktop(context)) return 64;
    if (isTablet(context)) return 60;
    return 56;
  }

  // Layout Spacing
  static EdgeInsets getContainerPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(24);
    if (isTablet(context)) return const EdgeInsets.all(20);
    return const EdgeInsets.all(16);
  }

  static double getSpacing(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (isTablet(context)) return 20;
    return 16;
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

  // Component Sizes
  static double getIconSize(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (isTablet(context)) return 22;
    return 20;
  }

  static double getBorderRadius(BuildContext context) {
    if (isDesktop(context)) return 12;
    if (isTablet(context)) return 10;
    return 8;
  }

  // Card and Grid Layout
  static double getCardElevation(BuildContext context) {
    if (isDesktop(context)) return 4;
    if (isTablet(context)) return 3;
    return 2;
  }

  static EdgeInsets getCardPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(24);
    if (isTablet(context)) return const EdgeInsets.all(20);
    return const EdgeInsets.all(16);
  }

  static int getGridCount(BuildContext context) {
    if (isDesktop(context)) return 4;
    if (isTablet(context)) return 2;
    return 1;
  }

  // Field Dimensions
  static double getFieldHeight(BuildContext context) {
    if (isDesktop(context)) return 56;
    if (isTablet(context)) return 48;
    return 40;
  }

  static double getFieldWidth(BuildContext context) {
    if (isDesktop(context)) return 320;
    if (isTablet(context)) return 280;
    return MediaQuery.of(context).size.width * 0.9;
  }

  // Padding Methods
  static EdgeInsets getPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(24);
    if (isTablet(context)) return const EdgeInsets.all(20);
    return const EdgeInsets.all(16);
  }

  static EdgeInsets getContentPadding(BuildContext context) {
    if (isDesktop(context)) 
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 24);
    if (isTablet(context))
      return const EdgeInsets.symmetric(horizontal: 24, vertical: 20);
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  }

  static EdgeInsets getItemPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(16);
    if (isTablet(context)) return const EdgeInsets.all(12);
    return const EdgeInsets.all(8);
  }

  static EdgeInsets getSectionPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(32);
    if (isTablet(context)) return const EdgeInsets.all(24);
    return const EdgeInsets.all(16);
  }
}