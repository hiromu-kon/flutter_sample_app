import 'package:hooks_riverpod/hooks_riverpod.dart';

final apibaseUrlProvider = Provider<String>((ref) {
  const flavor = String.fromEnvironment('FLAVOR');
  switch (flavor) {
    case 'dev':
      return 'http://localhost:33000/';
    case 'stg':
      return 'http://localhost:33000/';
    case 'prod':
      return 'http://localhost:33000/';
    default:
      throw AssertionError('Invalid flavor.');
  }
});
