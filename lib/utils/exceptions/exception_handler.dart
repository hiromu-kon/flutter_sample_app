import 'dart:io';

import 'package:flutter_sample_app/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final exceptionHandlerProvider =
    Provider<ExceptionHandler>(ExceptionHandler.new);

class ExceptionHandler {
  ExceptionHandler(this._ref);

  final Ref _ref;

  void handleException(Exception e, {String featureName = ''}) {
    var message = generalErrorMessage;
    if (e is ApiException) {
      _handleApiException(e);
    }

    if (featureName.isEmpty) {
      message = '$featureNameに失敗しました。';
    }

    _ref.read(scaffoldMessengerServiceProvider).showSnackBar(message);
  }

  void _handleApiException(ApiException e) {
    if (e.code == HttpStatus.unauthorized.toString()) {}
  }
}
