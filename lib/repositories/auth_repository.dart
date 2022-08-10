import 'package:dio/dio.dart';
import 'package:flutter_sample_app/services/services.dart';
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

  Future<Response<dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.post(
        '/auth/login',
        data: <String, dynamic>{
          'email': email,
          'password': password,
        },
      );

      return response;
    } on Exception catch (e) {
      logger.warning(e);
      throw AppException(message: e.toString());
    }
  }

  Future<Response<dynamic>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.post(
        '/auth/register',
        data: <String, dynamic>{
          'email': email,
          'password': password,
        },
      );

      return response;
    } on Exception catch (e) {
      logger.warning(e);
      throw AppException(message: e.toString());
    }
  }

  Future<void> signOut() async {
    await _client.post('/logout');
  }
}
