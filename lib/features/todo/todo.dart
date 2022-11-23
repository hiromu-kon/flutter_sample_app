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
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    final response = await ref.watch(todoRepositoryProvider).fetchTodos();
    return response.todos;
  } on AppException {
    rethrow;
  }
});

/// fetchTodosProviderで取得したデータをキャッシュするProvider
final cachedTodosProvider = StateProvider.autoDispose<List<Todo>>((ref) => []);

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
final createTodoProvider = Provider.autoDispose<
    Future<void> Function({
  required VoidCallback onSuccess,
})>(
  (ref) => ({
    required onSuccess,
  }) async {
    try {
      final read = ref.read;
      read(overlayLoadingProvider.notifier).update((state) => true);

      await ref.watch(todoRepositoryProvider).createTodo();

      onSuccess();

      read(scaffoldMessengerServiceProvider).showSnackBar('登録に成功しました。');
    } on Exception catch (e) {
      ref.read(scaffoldMessengerServiceProvider).showSnackBarByException(e);
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);

/// [TodoRepository]のeditTodo()をコールして指定したIdのTodoを編集するProvider
final editTodoProvider = Provider.autoDispose<
    Future<void> Function({
  required String todoId,
})>(
  (ref) => ({required todoId}) async {
    await ref.watch(todoRepositoryProvider).editTodo(todoId: todoId);
  },
);

/// [TodoRepository]のdeleteTodo()をコールして指定したIdのTodoを削除するProvider
final deleteTodoProvider =
    Provider.family.autoDispose((ref, String todoId) async {
  await ref.watch(todoRepositoryProvider).deleteTodo(todoId: todoId);
});
