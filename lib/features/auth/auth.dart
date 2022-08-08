import 'package:flutter/cupertino.dart';
import 'package:flutter_sample_app/features/common/overlay_loading.dart';
import 'package:flutter_sample_app/models/response_data/auth_response.dart';
import 'package:flutter_sample_app/models/response_result/response_result.dart';
import 'package:flutter_sample_app/repositories/auth_repository.dart';
import 'package:flutter_sample_app/services/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final emailControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

final passwordControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

final signInProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    try {
      final read = ref.read;
      read(overlayLoadingProvider.notifier).update((state) => true);
      final response = await ref.read(authRepositoryProvider).signIn(
            email: read(emailControllerProvider).text,
            password: read(passwordControllerProvider).text,
          );
      final data = AuthResponse.fromJson(response.data as Map<String, dynamic>);
      await read(sharedPreferencesServiceProvider)
          .setAccessToken(data.accessToken);
    } on Exception {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);

final signUpProvider = Provider<Future<void> Function()>(
  (ref) => () async {
    try {
      final read = ref.read;
      read(overlayLoadingProvider.notifier).update((state) => true);

      final response = await read(authRepositoryProvider).signUp(
        email: read(emailControllerProvider).text,
        password: read(passwordControllerProvider).text,
      );
      final data = AuthResponse.fromJson(response.data as Map<String, dynamic>);
      await read(sharedPreferencesServiceProvider)
          .setAccessToken(data.accessToken);
    } on Exception {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);

final signOutProvider = Provider<Future<void> Function()>(
  (ref) => () async {
    try {
      ref.read(overlayLoadingProvider.notifier).update((state) => true);

      await ref.read(authRepositoryProvider).signOut();
    } on Exception {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);
