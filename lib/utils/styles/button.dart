import 'package:flutter/material.dart';

class AppButtonStyle {
  AppButtonStyle._();

  /// 絵文字アイコンボタンに使用するスタイル
  static ButtonStyle emojiIconButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.black12),
    shadowColor: MaterialStateProperty.all(Colors.black),
    shape: MaterialStateProperty.all(
      const StadiumBorder(
        side: BorderSide(color: Colors.black26),
      ),
    ),
  );
}
