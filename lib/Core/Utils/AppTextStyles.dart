import 'package:flutter/material.dart';
import '../Utils/AppSizes.dart';

class AppTextStyles {
  static TextStyle sectionTitle(BuildContext context, {required bool isMobile}) {
    return TextStyle(
      color: Colors.white,
      fontSize: AppSizes.getSmallFontSize(context, isMobile: isMobile),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bodyText(BuildContext context, {required bool isMobile}) {
    return TextStyle(
      color: Colors.white,
      fontSize: AppSizes.getSmallFontSize(context, isMobile: isMobile),
      height: 1.5,
    );
  }

  static TextStyle bodyTextSmall(BuildContext context, {required bool isMobile}) {
    return TextStyle(
      color: Colors.white,
      fontSize: AppSizes.getSmallFontSize(context, isMobile: isMobile) * 0.9,
      height: 1.5,
    );
  }

  static TextStyle italicText(BuildContext context, {required bool isMobile}) {
    return TextStyle(
      color: Colors.white70,
      fontStyle: FontStyle.italic,
      fontSize: AppSizes.getSmallFontSize(context, isMobile: isMobile) * 0.9,
    );
  }

  static TextStyle highlightedText(BuildContext context, {required bool isMobile}) {
    return TextStyle(
      color: Colors.lightBlueAccent,
      fontWeight: FontWeight.bold,
      fontSize: AppSizes.getSmallFontSize(context, isMobile: isMobile),
    );
  }
}
