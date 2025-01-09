import 'package:flutter/material.dart';
import '../../../core/utils/base_responsive.dart';

class AuthResponsive extends BaseResponsive {
  // Login Container
  static double getLoginContainerWidth(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 480;
    if (BaseResponsive.isTablet(context)) return MediaQuery.of(context).size.width * 0.6;
    return MediaQuery.of(context).size.width * 0.9;
  }

  static double getLoginContainerHeight(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 600;
    if (BaseResponsive.isTablet(context)) return 550;
    return 500;
  }

  // Form Fields
  static double getFieldWidth(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 360;
    if (BaseResponsive.isTablet(context)) return 320;
    return MediaQuery.of(context).size.width * 0.8;
  }

  static double getFieldHeight(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 56;
    if (BaseResponsive.isTablet(context)) return 48;
    return 40;
  }

  // Font Sizes
  static double getHeadingSize(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 32;
    if (BaseResponsive.isTablet(context)) return 28;
    return 24;
  }

  static double getBodySize(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 16;
    if (BaseResponsive.isTablet(context)) return 14;
    return 12;
  }

  static double getLabelSize(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 14;
    if (BaseResponsive.isTablet(context)) return 12;
    return 10;
  }

  // Spacing
  static double getSpacing(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 24;
    if (BaseResponsive.isTablet(context)) return 20;
    return 16;
  }

  static EdgeInsets getPadding(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return const EdgeInsets.all(40);
    if (BaseResponsive.isTablet(context)) return const EdgeInsets.all(32);
    return const EdgeInsets.all(24);
  }

  // Component Styles
  static double getBorderRadius(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 12;
    if (BaseResponsive.isTablet(context)) return 10;
    return 8;
  }

  static double getIconSize(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 24;
    if (BaseResponsive.isTablet(context)) return 20;
    return 18;
  }

  // Button Styles
  static double getButtonHeight(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 48;
    if (BaseResponsive.isTablet(context)) return 44;
    return 40;
  }

  static double getButtonWidth(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 360;
    if (BaseResponsive.isTablet(context)) return 320;
    return MediaQuery.of(context).size.width * 0.8;
  }

  static EdgeInsets getButtonPadding(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) 
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    if (BaseResponsive.isTablet(context))
      return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  }

  static double getButtonBorderRadius(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 8;
    if (BaseResponsive.isTablet(context)) return 6;
    return 4;
  }

  static double getButtonFontSize(BuildContext context) {
    if (BaseResponsive.isDesktop(context)) return 16;
    if (BaseResponsive.isTablet(context)) return 14;
    return 12;
  }
}