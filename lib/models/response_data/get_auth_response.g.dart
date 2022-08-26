// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type, unnecessary_cast, todo

part of 'get_auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetAuthResponse _$$_GetAuthResponseFromJson(Map json) => $checkedCreate(
      r'_$_GetAuthResponse',
      json,
      ($checkedConvert) {
        final val = _$_GetAuthResponse(
          success: $checkedConvert('success', (v) => v as bool? ?? true),
          message: $checkedConvert('message', (v) => v as String? ?? ''),
          authData: $checkedConvert(
              'authData',
              (v) => v == null
                  ? Auth.defaultValue
                  : Auth.fromJson(Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_GetAuthResponseToJson(_$_GetAuthResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'authData': instance.authData.toJson(),
    };
