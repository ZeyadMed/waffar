import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waffar/core/theme/color_manager.dart';
import 'package:waffar/core/theme/font_manager.dart';
import 'package:waffar/core/theme/style_manager.dart';
import 'package:waffar/core/theme/value_manager.dart';

ThemeData getApplicationTheme() {
  return AppThemeData.light();
}

mixin AppThemeData on ThemeData {
  static ThemeData light() => ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    fontFamily: FontConstants.fontFamily,

    colorScheme: ColorScheme.light(
      primary: ColorManager.primary,
      secondary: ColorManager.secondary,
      surface: ColorManager.white,
      error: ColorManager.error,
      onPrimary: ColorManager.white,
      onSecondary: ColorManager.white,
      onSurface: ColorManager.black,
      onError: ColorManager.white,
    ),

    cardTheme: CardThemeData(
      color: ColorManager.white,
      elevation: AppSize.s4,
      shadowColor: ColorManager.grey,
    ),
    scaffoldBackgroundColor: ColorManager.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.white,
      ),
    ),

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s17,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(FontSize.s12),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s16,
      ),
      headlineLarge: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s16,
      ),
      headlineMedium: getRegularStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s14,
      ),
      titleMedium: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s16,
      ),
      titleSmall: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
      bodyLarge: getRegularStyle(color: ColorManager.grey1),
      bodySmall: getRegularStyle(color: ColorManager.grey),
      bodyMedium: getRegularStyle(
        color: ColorManager.grey2,
        fontSize: FontSize.s12,
      ),
      labelSmall: getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s12,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      labelStyle: getMediumStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      errorStyle: getRegularStyle(color: ColorManager.error, fontSize: 14.sp),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );

  static ThemeData dark() => ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorManager.darkPrimary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    fontFamily: FontConstants.fontFamily,

    colorScheme: ColorScheme.dark(
      primary: ColorManager.darkPrimary,
      secondary: ColorManager.secondary,
      surface: ColorManager.darkBackgroundColor,
      error: ColorManager.error,
      onPrimary: ColorManager.white,
      onSecondary: ColorManager.white,
      onSurface: ColorManager.white,
      onError: ColorManager.darkBackgroundColor,
    ),

    //card view theme
    cardTheme: CardThemeData(
      color: ColorManager.darkGrey,
      elevation: AppSize.s4,
      shadowColor: ColorManager.black,
    ),
    //scaffold
    scaffoldBackgroundColor: ColorManager.darkBackgroundColor,
    //appbar them
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorManager.darkBackgroundColor,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.white,
      ),
    ),

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.darkPrimary,
      splashColor: ColorManager.lightPrimary,
    ),
    //elevated bottom them
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s17,
        ),
        backgroundColor: ColorManager.darkPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(FontSize.s12),
        ),
      ),
    ),
    //text them
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
      headlineLarge: getSemiBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
      headlineMedium: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s14,
      ),
      titleMedium: getMediumStyle(
        color: ColorManager.darkPrimary,
        fontSize: FontSize.s16,
      ),
      titleSmall: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
      bodyLarge: getRegularStyle(color: ColorManager.white),
      bodySmall: getRegularStyle(color: ColorManager.grey),
      bodyMedium: getRegularStyle(
        color: ColorManager.grey2,
        fontSize: FontSize.s12,
      ),
      labelSmall: getBoldStyle(
        color: ColorManager.darkPrimary,
        fontSize: FontSize.s12,
      ),
    ).apply(bodyColor: Colors.white, displayColor: Colors.white),
    //input decoration them
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      labelStyle: getMediumStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      errorStyle: getRegularStyle(color: ColorManager.error, fontSize: 14.sp),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.darkPrimary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.darkPrimary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );

  static CupertinoThemeData cupertinoLight() => CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.white,
    barBackgroundColor: ColorManager.white,
    textTheme: CupertinoTextThemeData(
      primaryColor: ColorManager.black,
      textStyle: getRegularStyle(color: ColorManager.black),
      navTitleTextStyle: getSemiBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),
    ),
  );

  static CupertinoThemeData cupertinoDark() => CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorManager.darkPrimary,
    scaffoldBackgroundColor: ColorManager.darkBackgroundColor,
    barBackgroundColor: ColorManager.darkBackgroundColor,
    textTheme: CupertinoTextThemeData(
      primaryColor: ColorManager.white,
      textStyle: getRegularStyle(color: ColorManager.white),
      navTitleTextStyle: getSemiBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),
  );
}
