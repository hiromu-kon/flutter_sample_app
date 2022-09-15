import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppException', () {
    test('AppExceptionが呼ばれた場合、適当なメッセージとエラーコードが返却されること', () {
      const exception = AppException(code: '500');

      expect(exception.code, '500');
      expect(exception.message, null);
      expect(exception.defaultMessage, 'エラーが発生しました。');
    });

    test('ApiExceptionが呼ばれた場合、適当なメッセージとエラーコードが返却されること', () {
      const exception = ApiException(code: '500');

      expect(exception.code, '500');
      expect(exception.message, null);
      expect(exception.defaultMessage, 'サーバとの通信に失敗しました。');
    });

    test('UnauthorizedExceptionが呼ばれた場合、適当なメッセージとエラーコードが返却されること', () {
      const exception = UnauthorizedException();

      expect(exception.code, '401');
      expect(exception.message, null);
      expect(exception.defaultMessage, '認証されていません。');
    });

    test('ForbiddenExceptionが呼ばれた場合、適当なメッセージとエラーコードが返却されること', () {
      const exception = ForbiddenException();

      expect(exception.code, '403');
      expect(exception.message, null);
      expect(exception.defaultMessage, '指定した操作を行う権限がありません。');
    });

    test('ApiNotFoundExceptionが呼ばれた場合、適当なメッセージとエラーコードが返却されること', () {
      const exception = ApiNotFoundException();

      expect(exception.code, '404');
      expect(exception.message, null);
      expect(exception.defaultMessage, 'リクエストした API が見つかりませんでした。');
    });
  });
}
