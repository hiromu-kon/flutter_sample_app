// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type, unnecessary_cast, todo

part of 'get_posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetPostsResponse _$$_GetPostsResponseFromJson(Map json) => $checkedCreate(
      r'_$_GetPostsResponse',
      json,
      ($checkedConvert) {
        final val = _$_GetPostsResponse(
          success: $checkedConvert('success', (v) => v as bool? ?? true),
          message: $checkedConvert('message', (v) => v as String? ?? ''),
          posts: $checkedConvert(
              'posts',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          Post.fromJson(Map<String, dynamic>.from(e as Map)))
                      .toList() ??
                  Post.defaultListValue),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_GetPostsResponseToJson(_$_GetPostsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'posts': instance.posts.map((e) => e.toJson()).toList(),
    };
