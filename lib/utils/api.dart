import 'package:flutter_sample_app/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Map<String, dynamic> toResponseJson(dynamic data) {
  if (data == null) {
    return emptyMap;
  }
  if (data is List) {
    // リストの場合は適当なキー名として 'items' をつける
    return <String, dynamic>{'items': data};
  }
  if (data is Map) {
    return data as Map<String, dynamic>;
  }
  // リストでもマップでもない場合は存在するのか？？
  // 存在しない想定でとりあえず空のマップを返すことにした。
  return emptyMap;
}

/// HTTP 通信でのエラーの種別の列挙
enum ErrorCode {
  networkNotConnected,
}

final apibaseUrlProvider = Provider<String>((ref) {
  const flavor = String.fromEnvironment('FLAVOR');
  switch (flavor) {
    case 'dev':
      return 'http://localhost:33000/';
    case 'stg':
      return 'http://localhost:33000/';
    case 'prod':
      return 'http://localhost:33000/';
    default:
      throw AssertionError('Invalid flavor.');
  }
});
