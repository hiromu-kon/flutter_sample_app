// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type, unnecessary_cast, todo

part of 'get_todos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetTodosResponse _$$_GetTodosResponseFromJson(Map json) => $checkedCreate(
      r'_$_GetTodosResponse',
      json,
      ($checkedConvert) {
        final val = _$_GetTodosResponse(
          success: $checkedConvert('success', (v) => v as bool? ?? true),
          message: $checkedConvert('message', (v) => v as String? ?? ''),
          todos: $checkedConvert(
              'todos',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          Todo.fromJson(Map<String, dynamic>.from(e as Map)))
                      .toList() ??
                  Todo.defaultListValue),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_GetTodosResponseToJson(_$_GetTodosResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'todos': instance.todos.map((e) => e.toJson()).toList(),
    };
