// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type, unnecessary_cast, todo

part of 'get_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetPostResponse _$$_GetPostResponseFromJson(Map json) => $checkedCreate(
      r'_$_GetPostResponse',
      json,
      ($checkedConvert) {
        final val = _$_GetPostResponse(
          success: $checkedConvert('success', (v) => v as bool? ?? true),
          message: $checkedConvert('message', (v) => v as String? ?? ''),
          post: $checkedConvert('post',
              (v) => Post.fromJson(Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_GetPostResponseToJson(_$_GetPostResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'post': instance.post.toJson(),
    };
