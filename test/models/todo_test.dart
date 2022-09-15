import 'package:flutter_sample_app/models/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Todo', () {
    test('JsonからTodo型を生成できること', () {
      final json = {
        'id': 8,
        'title': 'todo test_title',
        'content': 'todo test_content',
        'isDone': false,
      };

      final todo = Todo.fromJson(json);

      expect(todo.id, 8);
      expect(todo.title, 'todo test_title');
      expect(todo.content, 'todo test_content');
      expect(todo.isDone, false);
    });

    test('Todo型からJsonを生成できること', () {
      final todo = Todo(
        id: 1,
        title: 'todo test_title',
        content: 'todo test_content',
        isDone: true,
      );

      final todoJson = todo.toJson();

      expect(todoJson['id'], 1);
      expect(todoJson['title'], 'todo test_title');
      expect(todoJson['content'], 'todo test_content');
      expect(todoJson['isDone'], true);
    });
  });
}
