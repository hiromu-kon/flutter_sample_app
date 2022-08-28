/// 全てのバリデーションを管理するクラス
class Validator {
  Validator._();

  /// 認証情報で扱う、emailのバリデーション
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'メールアドレスを入力してください';
    }

    return null;
  }

  /// 認証情報で扱う、passwordのバリデーション
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    }

    return null;
  }

  /// Userで扱う、introductionのバリデーション
  static String? introduction(String? value) {
    if (value == null || value.isEmpty) {
      return '紹介文を入力してください';
    } else if (value.length > 20) {
      return '紹介文は20文字以内で入力してください';
    }

    return null;
  }

  /// Todoで扱う、titleのバリデーション
  static String? title(String? value) {
    if (value == null || value.isEmpty) {
      return 'タイトルを入力してください';
    } else if (value.length > 20) {
      return 'タイトルは20文字以内で入力してください';
    }

    return null;
  }

  /// Todoで扱う、contentのバリデーション
  static String? content(String? value) {
    if (value == null || value.isEmpty) {
      return '内容を入力してください';
    } else if (value.length > 20) {
      return '内容は20文字以内で入力してください';
    }

    return null;
  }
}
