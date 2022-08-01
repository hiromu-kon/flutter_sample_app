import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get deviceWidth => MediaQuery.of(this).size.width;
  double get deviceHeight => MediaQuery.of(this).size.height;
  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;
  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;
  TextStyle get h1 => Theme.of(this).textTheme.headline1!;
  TextStyle get h2 => Theme.of(this).textTheme.headline2!;
  TextStyle get h3 => Theme.of(this).textTheme.headline3!;
  TextStyle get h4 => Theme.of(this).textTheme.headline4!;
  TextStyle get h5 => Theme.of(this).textTheme.headline5!;
  TextStyle get h6 => Theme.of(this).textTheme.headline6!;
  TextStyle get subtitleStyle => Theme.of(this).textTheme.subtitle1!;
  TextStyle get bodyStyle => Theme.of(this).textTheme.bodyText2!;
  TextStyle get smallStyle => Theme.of(this).textTheme.caption!;

  void showSnackBar(
    String text, {
    // Color backgroundColor = Colors.black,
    Duration duration = const Duration(milliseconds: 1500),
    VoidCallback? onTap,
    String closeLabel = '閉じる',
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        // backgroundColor: backgroundColor,
        content: Text(
          text,
          style: bodyStyle.copyWith(color: Colors.white),
        ),
        duration: duration,
        action: SnackBarAction(
          label: closeLabel,
          textColor: Colors.white,
          onPressed: () {
            if (onTap != null) {
              onTap();
            }
          },
        ),
      ),
    );
  }
}
