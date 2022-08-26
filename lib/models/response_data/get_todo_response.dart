import 'package:flutter_sample_app/models/response_data/base_response_data.dart';
import 'package:flutter_sample_app/models/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_todo_response.freezed.dart';
part 'get_todo_response.g.dart';

@freezed
class GetTodoResponse with _$GetTodoResponse {
  factory GetTodoResponse({
    @Default(true) bool success,
    @Default('') String message,
    required Todo todo,
  }) = _GetTodoResponse;

  factory GetTodoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTodoResponseFromJson(json);

  factory GetTodoResponse.fromBaseResponseData(
    BaseResponseData responseData,
  ) =>
      GetTodoResponse.fromJson(
        <String, dynamic>{
          'success': responseData.success,
          'message': responseData.message,
          'todo': responseData.data,
        },
      );
}
