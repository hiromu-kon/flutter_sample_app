import 'package:flutter_sample_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

const baseResponseDataConverter = BaseResponseDataConverter();

/// dynamicなResponseDataをMap<String, dynamic>に変換するConverter
class BaseResponseDataConverter
    implements JsonConverter<Map<String, dynamic>, dynamic> {
  const BaseResponseDataConverter();

  @override
  Map<String, dynamic> fromJson(dynamic data) {
    if (data == null) {
      return emptyMap;
    }
    if (data is List) {
      // データがリストである場合は
      // 'items'のキーをつけてMap<String, List<dynamic>>にする
      return <String, List<dynamic>>{'items': data};
    }
    return data as Map<String, dynamic>;
  }

  @override
  Map<String, dynamic> toJson(Map<String, dynamic> data) => data;
}
