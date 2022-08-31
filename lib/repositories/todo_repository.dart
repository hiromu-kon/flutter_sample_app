import 'package:flutter_sample_app/models/response_data/get_todo_response.dart';
import 'package:flutter_sample_app/models/response_data/get_todos_response.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoRepositoryProvider = Provider<TodoRepository>(
  (ref) => TodoRepository(
    client: ref.read(apiClientProvider),
    accessToken: ref.watch(sharedPreferencesServiceProvider).getAccessToken(),
  ),
);

class TodoRepository {
  TodoRepository({
    required ApiClient client,
    required this.accessToken,
  }) : _client = client;

  final ApiClient _client;
  final Future<String> accessToken;

  /// GET /todos APIをコールして、全てのTodoを取得する
  Future<GetTodosResponse> fetchTodos() async {
    final response = await _client.get('/todos');

    return response.when(
      success: GetTodosResponse.fromBaseResponseData,
      failure: (message) => throw AppException(message: message),
    );
  }

  /// GET /todos/{todoId} APIをコールして、指定したIdのTodoを取得する
  Future<GetTodoResponse> fetchTodoById({
    required int todoId,
  }) async {
    final response = await _client.get('/todo/$todoId');

    return response.when(
      success: GetTodoResponse.fromBaseResponseData,
      failure: (message) => throw AppException(message: message),
    );
  }

  // /// POST /todos APIをコールして、Todoを作成する
  Future<void> createTodo() async {
    final response = await _client.post(
      '/todos',
      header: <String, dynamic>{
        'authorization': await accessToken,
      },
    );

    response.when(
      success: (data) {},
      failure: (message) => throw AppException(message: message),
    );
  }

  /// PUT /todos/{todoId} APIをコールして指定したIdのTodoを編集する
  Future<void> editTodo({
    required String todoId,
  }) async {
    final response = await _client.put('/todos/$todoId');

    response.when(
      success: (data) {},
      failure: (message) => throw AppException(message: message),
    );
  }

  /// DELETE /todos/{todoId} APIをコールして指定したIdのTodoを削除する
  Future<void> deleteTodo({
    required String todoId,
  }) async {
    final response = await _client.delete('/todos/$todoId');

    response.when(
      success: (data) {},
      failure: (message) => throw AppException(message: message),
    );
  }
}
