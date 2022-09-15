import 'package:dio/dio.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DioErrorType Extension', () {
    test('DioErrorTypeがタイムアウトに該当するかどうか判定できること', () {
      const connectTimeout = DioErrorType.connectTimeout;
      const receiveTimeout = DioErrorType.receiveTimeout;
      const sendTimeout = DioErrorType.sendTimeout;
      const response = DioErrorType.response;
      const cancel = DioErrorType.cancel;
      const other = DioErrorType.other;

      expect(connectTimeout.isTimeout, true);
      expect(receiveTimeout.isTimeout, true);
      expect(sendTimeout.isTimeout, true);
      expect(response.isTimeout, false);
      expect(cancel.isTimeout, false);
      expect(other.isTimeout, false);
    });
  });
}
