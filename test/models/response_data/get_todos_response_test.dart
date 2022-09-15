// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_sample_app/models/response_data/base_response_data.dart';
import 'package:flutter_sample_app/models/response_data/get_todos_response.dart';
import 'package:flutter_sample_app/models/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetTodosResponse', () {
    test('JsonからGetTodosResponse型を生成できること', () {
      final json = {
        'success': false,
        'message': 'Failed get auth response',
        'todos': [
          {
            'id': 1,
            'title': 'title test',
            'content': 'content test',
            'isDone': true,
          },
          {
            'id': 2,
            'title': 'title test2',
            'content': 'content test2',
            'isDone': false,
          },
          {
            'id': 3,
            'title': 'title test3',
            'content': 'content test3',
            'isDone': true,
          },
        ]
      };

      final response = GetTodosResponse.fromJson(json);

      expect(response.success, false);
      expect(response.message, 'Failed get auth response');
      expect(response.todos.length, 3);
      expect(response.todos[2].id, 3);
      expect(response.todos[2].title, 'title test3');
      expect(response.todos[2].content, 'content test3');
      expect(response.todos[2].isDone, true);
    });

    test('GetTodosResponse型からJsonを生成できること', () {
      final response = GetTodosResponse(
        success: true,
        message: 'Success get auth response',
        todos: [
          Todo(
            id: 1,
            title: 'title test',
            content: 'content test',
            isDone: true,
          ),
          Todo(
            id: 2,
            title: 'title test2',
            content: 'content test2',
            isDone: false,
          ),
          Todo(
            id: 3,
            title: 'title test3',
            content: 'content test3',
            isDone: true,
          ),
        ],
      );

      final responseJson = response.toJson();

      expect(responseJson['success'], true);
      expect(responseJson['message'], 'Success get auth response');
      expect(responseJson['todos'][0]['id'], 1);
      expect(responseJson['todos'][0]['title'], 'title test');
      expect(responseJson['todos'][0]['content'], 'content test');
      expect(responseJson['todos'][0]['isDone'], true);
    });

    test('BaseResponseData型からGetTodosResponse型を生成できること', () {
      const responseData = BaseResponseData(
        success: true,
        message: 'Success get auth response',
        data: <String, dynamic>{
          'items': [
            {
              'id': 1,
              'title': 'title test',
              'content': 'content test',
              'isDone': false,
            },
            {
              'id': 2,
              'title': 'title test2',
              'content': 'content test2',
              'isDone': true,
            },
            {
              'id': 3,
              'title': 'title test3',
              'content': 'content test3',
              'isDone': false,
            },
          ]
        },
      );

      final response = GetTodosResponse.fromBaseResponseData(responseData);

      expect(response.success, true);
      expect(response.message, 'Success get auth response');
      expect(response.todos.length, 3);
      expect(response.todos[2].id, 3);
      expect(response.todos[2].title, 'title test3');
      expect(response.todos[2].content, 'content test3');
      expect(response.todos[2].isDone, false);
    });
  });
}
