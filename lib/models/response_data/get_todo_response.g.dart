// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type, unnecessary_cast, todo

part of 'get_todo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetTodoResponse _$$_GetTodoResponseFromJson(Map json) => $checkedCreate(
      r'_$_GetTodoResponse',
      json,
      ($checkedConvert) {
        final val = _$_GetTodoResponse(
          success: $checkedConvert('success', (v) => v as bool? ?? true),
          message: $checkedConvert('message', (v) => v as String? ?? ''),
          todo: $checkedConvert('todo',
              (v) => Todo.fromJson(Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_GetTodoResponseToJson(_$_GetTodoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'todo': instance.todo.toJson(),
    };
