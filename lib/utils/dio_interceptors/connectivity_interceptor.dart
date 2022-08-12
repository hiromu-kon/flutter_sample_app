import 'package:dio/dio.dart';
import 'package:flutter_sample_app/utils/utils.dart';

/// ネットワーク接続を確認しネットワーク接続がない場合はエラーを出す
class ConnectivityInterceptor extends Interceptor {
  ConnectivityInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!await isNetworkConnected) {
      // return handler.reject(
      //   DioError(
      //     error: ErrorCode.networkNotConnected,
      //     requestOptions: options,
      //   ),
      // );
    }
    return handler.next(options);
  }
}
