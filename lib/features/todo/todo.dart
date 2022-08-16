import 'package:flutter_sample_app/repositories/todo_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [TodoRepository]のfetchTodos()をコールして全てのTodoを取得する関数を提供するProvider
final fetchTodosProvider = Provider<Future<void> Function()>(
  (ref) => () async {
    await ref.read(todoRepositoryProvider).fetchTodos();
  },
);
