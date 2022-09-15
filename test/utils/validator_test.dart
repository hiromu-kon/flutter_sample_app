import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validator', () {
    test('emailバリデーションでエラーが発生した場合、エラーメッセージが返却されていること', () {
      final emptyValidation = Validator.email('');
      final nullValidation = Validator.email(null);

      expect(emptyValidation, 'メールアドレスを入力してください');
      expect(nullValidation, 'メールアドレスを入力してください');
    });

    test('passwordバリデーションでエラーが発生した場合、エラーメッセージが返却されていること', () {
      final emptyValidation = Validator.password('');
      final nullValidation = Validator.password(null);

      expect(emptyValidation, 'パスワードを入力してください');
      expect(nullValidation, 'パスワードを入力してください');
    });

    test('introductionバリデーションでエラーが発生した場合、エラーメッセージが返却されていること', () {
      final emptyValidation = Validator.introduction('');
      final nullValidation = Validator.introduction(null);
      final maxLengthValidation =
          Validator.introduction('テストの紹介文です。20文字以上のため、エラーが発生します。');

      expect(emptyValidation, '紹介文を入力してください');
      expect(nullValidation, '紹介文を入力してください');
      expect(maxLengthValidation, '紹介文は20文字以内で入力してください');
    });

    test('titleバリデーションでエラーが発生した場合、エラーメッセージが返却されていること', () {
      final emptyValidation = Validator.title('');
      final nullValidation = Validator.title(null);
      final maxLengthValidation =
          Validator.title('テストのタイトルです。20文字以上のため、エラーが発生します。');

      expect(emptyValidation, 'タイトルを入力してください');
      expect(nullValidation, 'タイトルを入力してください');
      expect(maxLengthValidation, 'タイトルは20文字以内で入力してください');
    });

    test('contentバリデーションでエラーが発生した場合、エラーメッセージが返却されていること', () {
      final emptyValidation = Validator.content('');
      final nullValidation = Validator.content(null);
      final maxLengthValidation =
          Validator.content('テストの内容です。20文字以上のため、エラーが発生します。');

      expect(emptyValidation, '内容を入力してください');
      expect(nullValidation, '内容を入力してください');
      expect(maxLengthValidation, '内容は20文字以内で入力してください');
    });
  });
}
