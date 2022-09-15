import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String Extension', () {
    test('文字列が空文字の場合、引数に指定した別の文字列が返ってくること', () {
      const emptyText = '';
      final text = emptyText.ifIsEmpty('empty placeholder');

      expect(text, 'empty placeholder');
    });

    test('指定した文字数を超えていた場合、それ以降の文字列が省略されていること', () {
      const text = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

      final truncatedText = text.truncated(7);

      expect(truncatedText, 'ABCDEFG...');
    });
  });
}
