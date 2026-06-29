import 'package:flutter/material.dart';

/// Centralized color palette used by the light/dark themes in `theme_maner.dart`.
/// Brand colors are aligned with [AppColors.mainAppColor] (0xFF00347D).
class ColorManager {
  ColorManager._();

  // ---- Brand ----
  static const Color primary = Color(0xFF00347D);
  static const Color lightPrimary = Color(0xFF3D6BB3);
  static const Color darkPrimary = Color(0xFF001F4D);
  static const Color secondary = Color(0xFF5B173E);

  // ---- Neutrals ----
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF9A9A9A);
  static const Color grey1 = Color(0xFF737477);
  static const Color grey2 = Color(0xFFC7C8CB);
  static const Color darkGrey = Color(0xFF1E1E1E);

  // ---- Dark mode surfaces ----
  static const Color darkBackgroundColor = Color(0xFF121212);

  // ---- Status ----
  static const Color error = Color(0xFFE61F34);
}
