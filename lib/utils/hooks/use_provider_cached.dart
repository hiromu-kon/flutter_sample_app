import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

AsyncValue<T> useProviderCached<T>(AsyncValue<T> provider) {
  final cache = useState<AsyncValue<T>>(provider);

  if (provider is! AsyncLoading) {
    cache.value = provider;
    return provider;
  }

  if (cache.value != null && cache.value is! AsyncLoading) {
    return cache.value;
  }

  cache.value = provider;
  return provider;
}
