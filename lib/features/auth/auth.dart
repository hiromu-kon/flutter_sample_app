import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

/// [AuthRepository]のsignIn()をコールしてサインインを提供するProvider
final signInProvider = Provider.autoDispose<
    Future<void> Function({
  required VoidCallback onSuccess,
})>(
  (ref) => ({
    required onSuccess,
  }) async {
    try {
      final read = ref.read;
      read(overlayLoadingProvider.notifier).update((state) => true);

      final response = await ref.read(authRepositoryProvider).signIn(
            email: read(emailTextEditingControllerProvider).value.text,
            password: read(passwordTextEditingControllerProvider).value.text,
          );

      await read(sharedPreferencesServiceProvider)
          .setAccessToken(response.authData.accessToken);

      onSuccess();
      read(scaffoldMessengerServiceProvider).showSnackBar('ログインしました');
    } on Exception catch (e) {
      ref.read(scaffoldMessengerServiceProvider).showSnackBarByException(e);
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);

/// [AuthRepository]のsignUp()をコールしてサインアップを提供するProvider
final signUpProvider = Provider<
    Future<void> Function({
  required VoidCallback onSuccess,
})>(
  (ref) => ({
    required onSuccess,
  }) async {
    try {
      final read = ref.read;
      read(overlayLoadingProvider.notifier).update((state) => true);

      final response = await read(authRepositoryProvider).signUp(
        email: read(emailTextEditingControllerProvider).value.text,
        password: read(passwordTextEditingControllerProvider).value.text,
      );

      await read(sharedPreferencesServiceProvider)
          .setAccessToken(response.authData.accessToken);

      onSuccess();
      read(scaffoldMessengerServiceProvider).showSnackBar('登録しました');
    } on Exception catch (e) {
      ref.read(scaffoldMessengerServiceProvider).showSnackBarByException(e);
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);

/// [AuthRepository]のsignOut()をコールしてサインアウトを提供するProvider
final signOutProvider = Provider<
    Future<void> Function({
  required VoidCallback onSuccess,
})>(
  (ref) => ({
    required onSuccess,
  }) async {
    try {
      final read = ref.read;
      read(overlayLoadingProvider.notifier).update((state) => true);

      await read(authRepositoryProvider).signOut();

      await read(sharedPreferencesServiceProvider).removeByAccessToken();

      onSuccess();
      read(scaffoldMessengerServiceProvider).showSnackBar('ログアウトしました');
    } on Exception catch (e) {
      ref.read(scaffoldMessengerServiceProvider).showSnackBarByException(e);
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);
