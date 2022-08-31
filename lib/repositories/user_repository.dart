import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepository());

class UserRepository {}
