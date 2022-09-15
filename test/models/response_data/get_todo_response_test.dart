// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_sample_app/models/response_data/base_response_data.dart';
import 'package:flutter_sample_app/models/response_data/get_todo_response.dart';
import 'package:flutter_sample_app/models/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetTodoResponse', () {
    test('JsonからGetTodoResponse型を生成できること', () {
      final json = {
        'success': false,
        'message': 'Failed get auth response',
        'todo': {
          'id': 1,
          'title': 'test title',
          'content': 'test content',
          'isDone': false,
        }
      };

      final response = GetTodoResponse.fromJson(json);

      expect(response.success, false);
      expect(response.message, 'Failed get auth response');
      expect(response.todo.id, 1);
      expect(response.todo.title, 'test title');
      expect(response.todo.content, 'test content');
      expect(response.todo.isDone, false);
    });

    test('GetTodoResponse型からJsonを生成できること', () {
      final response = GetTodoResponse(
        success: true,
        message: 'Success get auth response',
        todo: Todo(
          id: 1,
          title: 'title test',
          content: 'content test',
          isDone: false,
        ),
      );

      final responseJson = response.toJson();

      expect(responseJson['success'], true);
      expect(responseJson['message'], 'Success get auth response');
      expect(responseJson['todo']['id'], 1);
      expect(responseJson['todo']['title'], 'title test');
      expect(responseJson['todo']['content'], 'content test');
      expect(responseJson['todo']['isDone'], false);
    });

    test('BaseResponseData型からGetTodoResponse型を生成できること', () {
      const responseData = BaseResponseData(
        success: true,
        message: 'Success get auth response',
        data: <String, dynamic>{
          'id': 1,
          'title': 'title test',
          'content': 'content test',
          'isDone': false,
        },
      );

      final response = GetTodoResponse.fromBaseResponseData(responseData);

      expect(response.success, true);
      expect(response.message, 'Success get auth response');
      expect(response.todo.id, 1);
      expect(response.todo.title, 'title test');
      expect(response.todo.content, 'content test');
      expect(response.todo.isDone, false);
    });
  });
}
