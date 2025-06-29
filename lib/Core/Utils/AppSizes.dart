import 'dart:math';
import 'package:flutter/cupertino.dart';

class AppSizes {
  static double getFontSize(BuildContext context, {required bool isMobile}) {
    final width = MediaQuery.of(context).size.width;
    return isMobile ? width * 0.045 : min(width * 0.03, 18);
  }

  static double getSmallFontSize(
      BuildContext context, {
        required bool isMobile,
      }) {
    final width = MediaQuery.of(context).size.width;
    return isMobile ? width * 0.03 : min(width * 0.035, 20);
  }

  static double getPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 600 ? width * 0.03 : 16;
  }

  static double getImageSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 600 ? width * 0.3 : 180;
  }

  static double getCardWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 600 ? width * 0.5 : width * 0.50;
  }

  static double getSectionSpacing(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return height < 600 ? height * 0.05 : 50; // Reduced spacing
  }

  static int getProjectGridCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 400) return 1;
    if (width < 600) return 2;
    return 3;
  }

  static double getMaxContentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return min(width * 0.9, 1200);
  }
}
