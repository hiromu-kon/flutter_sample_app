import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  /// テーマのタイトル文字列を取得する
  String get title {
    switch (this) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Lignt';
      case ThemeMode.dark:
        return 'Dark';
    }
  }

  /// テーマのサブタイトル文字列を取得する
  String get subtitle {
    switch (this) {
      case ThemeMode.system:
        return '端末のシステム設定に追従';
      case ThemeMode.light:
        return '白を基調とした明るいテーマ';
      case ThemeMode.dark:
        return '黒を基調とした暗いテーマ';
    }
  }

  /// テーマアイコンを取得する
  IconData get iconData {
    switch (this) {
      case ThemeMode.system:
        return Icons.autorenew;
      case ThemeMode.light:
        return Icons.wb_sunny;
      case ThemeMode.dark:
        return Icons.nightlife;
    }
  }
}
