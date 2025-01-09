import 'package:flutter/material.dart';

class BaseResponsive {
  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // Screen Detection
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;

  // Font Sizes
  static double getHeadingSize(BuildContext context) {
    if (isDesktop(context)) return 32;
    if (isTablet(context)) return 28;
    return 24;
  }

  static double getBodySize(BuildContext context) {
    if (isDesktop(context)) return 16;
    if (isTablet(context)) return 14;
    return 12;
  }

  // Button Styles
  static double getButtonFontSize(BuildContext context) {
    if (isDesktop(context)) return 16;
    if (isTablet(context)) return 14;
    return 12;
  }

  static EdgeInsets getButtonPadding(BuildContext context) {
    if (isDesktop(context)) 
      return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
    if (isTablet(context))
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  }

  // Spacing
  static EdgeInsets getPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(24);
    if (isTablet(context)) return const EdgeInsets.all(16);
    return const EdgeInsets.all(12);
  }

  static double getSpacing(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (isTablet(context)) return 16;
    return 12;
  }

  // Component Dimensions
  static double getCardWidth(BuildContext context) {
    if (isDesktop(context)) return 320;
    if (isTablet(context)) return 280;
    return MediaQuery.of(context).size.width * 0.9;
  }

  static double getButtonHeight(BuildContext context) {
    if (isDesktop(context)) return 48;
    if (isTablet(context)) return 44;
    return 40;
  }

  static double getBorderRadius(BuildContext context) {
    if (isDesktop(context)) return 12;
    if (isTablet(context)) return 10;
    return 8;
  }

  static double getIconSize(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (isTablet(context)) return 22;
    return 20;
  }


  // Field Dimensions
  static double getFieldWidth(BuildContext context) {
    if (isDesktop(context)) return 360;
    if (isTablet(context)) return 320;
    return MediaQuery.of(context).size.width * 0.85;
  }

  static double getFieldHeight(BuildContext context) {
    if (isDesktop(context)) return 56;
    if (isTablet(context)) return 48;
    return 44;
  }

  // Text Field Padding
  static EdgeInsets getTextFieldPadding(BuildContext context) {
    if (isDesktop(context)) 
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    if (isTablet(context))
      return const EdgeInsets.symmetric(horizontal: 12, vertical: 10);
    return const EdgeInsets.symmetric(horizontal: 10, vertical: 8);
  }

  // Label Font Size
  static double getLabelSize(BuildContext context) {
    if (isDesktop(context)) return 16;
    if (isTablet(context)) return 14;
    return 12;
  }
  // Horizontal & Vertical Spacing
  static double getHorizontalSpacing(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (isTablet(context)) return 20;
    return 16;
  }

  static double getVerticalSpacing(BuildContext context) {
    if (isDesktop(context)) return 20;
    if (isTablet(context)) return 16;
    return 12;
  }

  // Container Dimensions
  static double getContainerWidth(BuildContext context) {
    if (isDesktop(context)) return 480;
    if (isTablet(context)) return MediaQuery.of(context).size.width * 0.7;
    return MediaQuery.of(context).size.width * 0.9;
  }

  static double getContainerHeight(BuildContext context) {
    if (isDesktop(context)) return 600;
    if (isTablet(context)) return 550;
    return 500;
  }

  static EdgeInsets getContainerPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(40);
    if (isTablet(context)) return const EdgeInsets.all(32);
    return const EdgeInsets.all(24);
  }
}