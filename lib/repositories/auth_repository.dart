import 'package:flutter_sample_app/models/response_data/get_auth_response.dart';
import 'package:flutter_sample_app/utils/utils.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(client: ref.read(apiClientProvider)),
);

class AuthRepository {
  AuthRepository({
    required ApiClient client,
  }) : _client = client;

  final ApiClient _client;

  /// POST /auth/login APIをコールしてサインインをする
  Future<GetAuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      '/auth/login',
      data: <String, dynamic>{
        'email': email,
        'password': password,
      },
    );

    return response.when(
      success: GetAuthResponse.fromBaseResponseData,
      failure: (message) => throw AppException(message: message),
    );
  }

  /// POST /auth/signup APIをコールしてサインアップをする
  Future<GetAuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      '/auth/signup',
      data: <String, dynamic>{
        'email': email,
        'password': password,
      },
    );

    return response.when(
      success: GetAuthResponse.fromBaseResponseData,
      failure: (message) => throw AppException(message: message),
    );
  }

  /// POST /signout APIをコールしてサインアウトをする
  Future<void> signOut() async {
    await _client.post('/signout');
  }
}
