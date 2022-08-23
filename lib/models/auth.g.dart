// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type, unnecessary_cast, todo

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Auth _$$_AuthFromJson(Map json) => $checkedCreate(
      r'_$_Auth',
      json,
      ($checkedConvert) {
        final val = _$_Auth(
          accessToken:
              $checkedConvert('accessToken', (v) => v as String? ?? ''),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_AuthToJson(_$_Auth instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
    };
