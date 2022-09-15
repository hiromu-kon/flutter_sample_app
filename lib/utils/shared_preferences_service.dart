import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKey {
  /// 最後にアクティブだった下タブのインデックス番号
  lastActiveBottomTab,

  /// アクセストークン
  accessToken,

  /// 起動済みかどうか
  isLaunched,

  /// 選択しているテーマ
  selectedTheme,
}

/// SharedPreferences のインスタンスを提供するプロバイダ。
/// ProviderScope の overrides 一で使用する。
final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());

/// SharedPreferences によるデータの読み書きをするServiceクラスを提供するプロバイダ
final sharedPreferencesServiceProvider = Provider<SharedPreferencesService>(
  (ref) => SharedPreferencesService(ref.read),
);

class SharedPreferencesService {
  SharedPreferencesService(this._read);
  final Reader _read;

  /// アクセストークンを取得する
  Future<String> getAccessToken() =>
      _getString(SharedPreferencesKey.accessToken);

  /// アクセストークンを保存する
  Future<bool> setAccessToken(String accessToken) =>
      _setString(SharedPreferencesKey.accessToken, accessToken);

  /// アクセストークンを削除する
  Future<bool> removeByAccessToken() async {
    return _removeByKeyName(SharedPreferencesKey.accessToken);
  }

  /// 起動済みかどうかを保存する
  Future<bool> setIsLaunched() =>
      _setBool(SharedPreferencesKey.isLaunched, true);

  /// 起動済みかどうかを取得する
  Future<bool> getIsLaunched() => _getBool(SharedPreferencesKey.isLaunched);

  /// 選択しているテーマを保存する
  Future<bool> setSelectedTheme(int selectedTheme) =>
      _setInt(SharedPreferencesKey.selectedTheme, selectedTheme);

  /// 選択しているテーマを取得する
  Future<int> getSelectedTheme() => _getInt(SharedPreferencesKey.selectedTheme);

  /// int 型のキー・バリューを取得する
  Future<int> _getInt(SharedPreferencesKey key) async {
    return _read(sharedPreferencesProvider).getInt(key.name) ?? 0;
  }

  /// int 型のキー・バリューペアを保存する
  Future<bool> _setInt(SharedPreferencesKey key, int value) async {
    return _read(sharedPreferencesProvider).setInt(key.name, value);
  }

  /// String 型のキー・バリューペアを保存する
  Future<bool> _setString(SharedPreferencesKey key, String value) async {
    return _read(sharedPreferencesProvider).setString(key.name, value);
  }

  /// String 型のキー・バリューを取得する
  Future<String> _getString(SharedPreferencesKey key) async {
    return _read(sharedPreferencesProvider).getString(key.name) ?? '';
  }

  /// bool 型のキー・バリューペアを保存する
  Future<bool> _setBool(SharedPreferencesKey key, bool value) async {
    return _read(sharedPreferencesProvider).setBool(key.name, value);
  }

  /// bool 型のキー・バリューを取得する
  Future<bool> _getBool(SharedPreferencesKey key) async {
    return _read(sharedPreferencesProvider).getBool(key.name) ?? false;
  }

  /// String 型のキー・バリューを取得する
  // Future<String> _getStringByStringKey(String stringKey) async {
  //   return _read(sharedPreferencesProvider).getString(stringKey) ?? '';
  // }

  /// String 型のキー・バリューペアを保存する
  // Future<bool> _setStringByStringKey(String stringKey, String value) async {
  //   return _read(sharedPreferencesProvider).setString(stringKey, value);
  // }

  /// SharedPreferences に保存している特定のキー・バリューペアを削除する
  // Future<bool> _removeByKey(SharedPreferencesKey key) async {
  //   return _read(sharedPreferencesProvider).remove(key.name);
  // }

  /// SharedPreferences に保存している特定のキー・バリューペアを削除する
  Future<bool> _removeByKeyName(SharedPreferencesKey key) async {
    return _read(sharedPreferencesProvider).remove(key.name);
  }

  /// SharedPreferences に保存している値をすべて消す
  Future<bool> clearAll() async {
    return _read(sharedPreferencesProvider).clear();
  }
}
