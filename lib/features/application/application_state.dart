import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_state.freezed.dart';

@freezed
class ApplicationState with _$ApplicationState {
  const factory ApplicationState({
    @Default(ThemeMode.system) ThemeMode selectedThemeMode,
  }) = _ApplicationState;
}
