import 'package:flutter_sample_app/providers/auth/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final accountProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(),
);

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState());
}
