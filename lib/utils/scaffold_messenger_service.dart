import 'package:flutter/material.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scaffoldKeyProvider = Provider<GlobalKey<ScaffoldMessengerState>>(
  (ref) => GlobalKey<ScaffoldMessengerState>(),
);

final scaffoldMessengerServiceProvider =
    Provider.autoDispose(ScaffoldMessengerService.new);

class ScaffoldMessengerService {
  ScaffoldMessengerService(this._ref);

  final AutoDisposeProviderRef<ScaffoldMessengerService> _ref;

  GlobalKey<ScaffoldMessengerState> get scaffoldKey =>
      _ref.read(scaffoldKeyProvider);

  /// スナックバーを表示する。
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message, {
    bool removeCurrentSnackBar = true,
    Duration duration = defaultSnackBarDuration,
  }) {
    final scaffoldMessengerState = scaffoldKey.currentState!;
    if (removeCurrentSnackBar) {
      scaffoldMessengerState.removeCurrentSnackBar();
    }
    return scaffoldMessengerState.showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: defaultSnackBarBehavior,
        duration: duration,
      ),
    );
  }

  /// Exception 起点でスナックバーを表示する。
  /// Dart の Exception 型の場合は toString() 冒頭を取り除いて
  /// 差し支えのないメッセージに置換しておく。
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackBarByException(Exception e) {
    final message =
        e.toString().replaceAll('Exception: ', '').replaceAll('Exception', '');
    return showSnackBar(message.ifIsEmpty(generalExceptionMessage));
  }
}
