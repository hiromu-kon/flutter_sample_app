import 'package:flutter/cupertino.dart';
import 'package:flutter_sample_app/features/common/overlay_loading.dart';
import 'package:flutter_sample_app/repositories/auth_repository.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final emailTextEditingControllerProvider =
    Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

final passwordTextEditingControllerProvider =
    Provider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

/// [AuthRepository]のsignIn()をコールしてサインインをする関数を提供するProvider
final signInProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    try {
      final read = ref.read;
      read(overlayLoadingProvider.notifier).update((state) => true);

      final response = await ref.read(authRepositoryProvider).signIn(
            email: read(emailTextEditingControllerProvider).value.text,
            password: read(passwordTextEditingControllerProvider).value.text,
          );

      await read(sharedPreferencesServiceProvider)
          .setAccessToken(response.accessToken);
    } on AppException {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);

/// [AuthRepository]のsignUp()をコールしてサインアップをする関数を提供するProvider
final signUpProvider = Provider<Future<void> Function()>(
  (ref) => () async {
    try {
      final read = ref.read;
      read(overlayLoadingProvider.notifier).update((state) => true);

      final response = await read(authRepositoryProvider).signUp(
        email: read(emailTextEditingControllerProvider).value.text,
        password: read(passwordTextEditingControllerProvider).value.text,
      );

      await read(sharedPreferencesServiceProvider)
          .setAccessToken(response.accessToken);
    } on AppException {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);

/// [AuthRepository]のsignOut()をコールしてサインアウトをする関数を提供するProvider
final signOutProvider = Provider<Future<void> Function()>(
  (ref) => () async {
    try {
      ref.read(overlayLoadingProvider.notifier).update((state) => true);

      await ref.read(authRepositoryProvider).signOut();
    } on AppException {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);
