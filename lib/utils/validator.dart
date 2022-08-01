/// 全てのバリデーションを管理するクラス
class Validator {
  Validator._();

  /// emailのバリデーション
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'メールアドレスを入力してください';
    }

    return null;
  }

  /// passwordのバリデーション
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'メールアドレスを入力してください';
    }

    return null;
  }
}
