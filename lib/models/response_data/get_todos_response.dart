import 'package:flutter_sample_app/models/response_data/base_response_data.dart';
import 'package:flutter_sample_app/models/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_todos_response.freezed.dart';
part 'get_todos_response.g.dart';

@freezed
class GetTodosResponse with _$GetTodosResponse {
  factory GetTodosResponse({
    @Default(true) bool success,
    @Default('') String message,
    @Default(Todo.defaultListValue) List<Todo> todos,
  }) = _GetTodosResponse;

  factory GetTodosResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTodosResponseFromJson(json);

  factory GetTodosResponse.fromBaseResponseData(
    BaseResponseData responseData,
  ) {
    return GetTodosResponse.fromJson(
      <String, dynamic>{
        'success': responseData.success,
        'message': responseData.message,
        'todos': responseData.data['items'],
      },
    );
  }
}
