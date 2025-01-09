import 'package:flutter/material.dart';
import '../../../../../core/utils/base_responsive.dart';

class CustomerAccountsResponsive extends BaseResponsive {


    static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 768 && width < 1024;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  static double getHeaderSize(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (BaseResponsive.isTablet(context)) return 22;
    return 20;
  }

  static double getBodySize(BuildContext context) {
    if (isDesktop(context)) return 16;
    if (BaseResponsive.isTablet(context)) return 14;
    return 12;
  }

  static EdgeInsets getScreenPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(24);
    if (BaseResponsive.isTablet(context)) return const EdgeInsets.all(20);
    return const EdgeInsets.all(16);
  }

  static double getListSpacing(BuildContext context) {
    if (isDesktop(context)) return 20;
    if (BaseResponsive.isTablet(context)) return 16;
    return 12;
  }

  static double getButtonHeight(BuildContext context) {
    if (isDesktop(context)) return 48;
    if (BaseResponsive.isTablet(context)) return 44;
    return 40;
  }

  static double getSearchBarHeight(BuildContext context) {
    if (isDesktop(context)) return 56;
    if (BaseResponsive.isTablet(context)) return 48;
    return 40;
  }

  static double getBorderRadius(BuildContext context) {
    if (isDesktop(context)) return 12;
    if (BaseResponsive.isTablet(context)) return 10;
    return 8;
  }

  static double getCardElevation(BuildContext context) {
    if (isDesktop(context)) return 8;
    if (BaseResponsive.isTablet(context)) return 6;
    return 4;
  }

  static EdgeInsets getListItemPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    if (BaseResponsive.isTablet(context)) return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
    return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  }

  static EdgeInsets getButtonPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
    if (BaseResponsive.isTablet(context)) return const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  }

  static double getIconSize(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (BaseResponsive.isTablet(context)) return 20;
    return 16;
  }

  static double getFieldWidth(BuildContext context) {
    if (isDesktop(context)) return 400;
    if (BaseResponsive.isTablet(context)) return 320;
    return MediaQuery.of(context).size.width * 0.9;
  }

  static EdgeInsets getFieldPadding(BuildContext context) {
    if (isDesktop(context)) return const EdgeInsets.all(16);
    if (BaseResponsive.isTablet(context)) return const EdgeInsets.all(12);
    return const EdgeInsets.all(8);
  }
}