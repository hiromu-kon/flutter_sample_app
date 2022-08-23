import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/todo.dart';
import 'package:flutter_sample_app/repositories/todo_repository.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final titleTextEditingControllerProvider =
    Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

final contentTextEditingControllerProvider =
    Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

/// [TodoRepository]のfetchTodos()をコールして全てのTodoを取得するProvider
final fetchTodosProvider = FutureProvider.autoDispose<List<Todo>>((ref) async {
  try {
    await Future<dynamic>.delayed(const Duration(seconds: 3));
    final response = await ref.watch(todoRepositoryProvider).fetchTodos();
    final todos = response.todos;
    return todos;
  } on AppException {
    rethrow;
  }
});

/// [TodoRepository]のfetchTodo()をコールして指定したIdのTodoを取得するProvider
final fetchTodoProvider =
    FutureProvider.family.autoDispose<Todo, int>((ref, int todoId) async {
  try {
    final response =
        await ref.watch(todoRepositoryProvider).fetchTodoById(todoId: todoId);
    final todo = response.todo;
    return todo;
  } on AppException {
    rethrow;
  }
});

/// [TodoRepository]のcreateTodo()をコールして指定したIdのTodoを取得するProvider
final createTodoProvider = Provider((ref) async {
  await ref.watch(todoRepositoryProvider).createTodo();
});

/// [TodoRepository]のeditTodo()をコールして指定したIdのTodoを編集するProvider
final editTodoProvider =
    Provider.family.autoDispose((ref, String todoId) async {
  await ref.watch(todoRepositoryProvider).editTodo(todoId: todoId);
});

/// [TodoRepository]のdeleteTodo()をコールして指定したIdのTodoを削除するProvider
final deleteTodoProvider =
    Provider.family.autoDispose((ref, String todoId) async {
  await ref.watch(todoRepositoryProvider).deleteTodo(todoId: todoId);
});
