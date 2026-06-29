import 'package:flutter/material.dart';

/// Font family + weight + size tokens used by `style_manager.dart` and the themes.
class FontConstants {
  FontConstants._();

  /// Matches the family registered in pubspec.yaml.
  static const String fontFamily = 'Alexandria';
}

class FontWeightManager {
  FontWeightManager._();

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  FontSize._();

  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
}
