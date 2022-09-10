import 'package:flutter/material.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'application_state.dart';

final applicationProvider =
    StateNotifierProvider<ApplicationStateNotifierProvider, ApplicationState>(
  (ref) => ApplicationStateNotifierProvider(ref.read),
);

/// アプリケーション全体で保持・操作したい状態をまとめる
class ApplicationStateNotifierProvider extends StateNotifier<ApplicationState> {
  ApplicationStateNotifierProvider(this._read)
      : super(const ApplicationState()) {
    initialize();
  }

  final Reader _read;

  Future<void> initialize() async {
    /// 選択されたテーマの記憶があれば取得して反映
    final themeIndex =
        await _read(sharedPreferencesServiceProvider).getSelectedTheme();

    state = state.copyWith(
      selectedThemeMode: ThemeMode.values.firstWhere(
        (e) => e.index == themeIndex,
        orElse: () => ThemeMode.system,
      ),
    );
  }

  /// テーマを変更する
  Future<void> changeSelectedTheme(ThemeMode theme) async {
    await _read(sharedPreferencesServiceProvider).setSelectedTheme(theme.index);
    state = state.copyWith(selectedThemeMode: theme);
  }
}
