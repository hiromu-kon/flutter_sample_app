import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Dio のインスタンスを各種設定を済ませた状態で提供するプロバイダ
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio()
    ..httpClientAdapter = DefaultHttpClientAdapter()
    ..options = BaseOptions(
      baseUrl: ref.watch(apibaseUrlProvider),
      connectTimeout: 100000,
      receiveTimeout: 100000,
      validateStatus: (_) => true,
    )
    ..interceptors.addAll(<Interceptor>[
      HeaderInterceptor(),
      // デバッグモードでは RequestInterceptor を追加
      if (kDebugMode) RequestInterceptor(),
      // デバッグモードでは ResponseInterceptor を追加
      if (kDebugMode) ResponseInterceptor(),

      ConnectivityInterceptor(),
    ]);
  return dio;
});
