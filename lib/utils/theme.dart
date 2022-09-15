import 'package:flutter/material.dart';
import 'package:flutter_sample_app/utils/utils.dart';

ThemeData getAppThemeLight() {
  final base = ThemeData(
    brightness: Brightness.light,
    fontFamily: FontFamily.yuseiMagic,
  );
  return base.copyWith(
    primaryColor: ColorName.primary,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: ColorName.primary,
      textTheme: ButtonTextTheme.normal,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      iconTheme: base.iconTheme.copyWith(color: Colors.white),
      color: ColorName.primary,
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: ColorName.primary,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
      backgroundColor: Colors.white,
      selectedItemColor: ColorName.primary,
      unselectedItemColor: Colors.black.withOpacity(0.4),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}

ThemeData getAppThemeDark() {
  final base = ThemeData(
    colorScheme: const ColorScheme.dark(),
    fontFamily: FontFamily.yuseiMagic,
  );
  return base.copyWith(
    primaryColor: ColorName.primary,
    colorScheme: base.colorScheme.copyWith(
      primary: ColorName.primary,
    ),
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: ColorName.primary,
      textTheme: ButtonTextTheme.normal,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      iconTheme: base.iconTheme.copyWith(color: Colors.grey),
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: ColorName.primary,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
      selectedItemColor: ColorName.primary,
    ),
  );
}
