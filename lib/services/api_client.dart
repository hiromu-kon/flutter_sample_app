import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_sample_app/features/common/dio.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient(ref.read));

class ApiClient {
  ApiClient(this._read);
  final Reader _read;

//   Future<ResponseResult<dynamic>> get(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? header,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final response = await _read(dioProvider).get<dynamic>(
//         path,
//         queryParameters: queryParameters,
//         options: options ?? Options(headers: header),
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return ResponseResult<dynamic>.success(response.data);
//     } on DioError catch (dioError) {
//       final exception = _handleDioError(dioError);
//       // return ResponseResult<dynamic>.failure(exception);
//     } on ApiException catch (e) {
//       // return ResponseResult.failure(message: e.toString());
//     } on SocketException {
//       // return const ResponseResult.failure(message: networkNotConnected);
//     } on FormatException {
//       // return const ResponseResult.failure(message: responseFormatNotValid);
//     } on Exception catch (e) {
//       // return ResponseResult.failure(message: e.toString());
//     }
//   }

//   Future<ResponseResult<dynamic>> put(
//     String path, {
//     Map<String, dynamic>? data,
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? header,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final response = await _read(dioProvider).put<dynamic>(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options ?? Options(headers: header),
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       // final baseResponseData = _parseResponse(response);
//       // return ResponseResult.success(data: baseResponseData);
//     } on DioError catch (dioError) {
//       final exception = _handleDioError(dioError);
//       // return ResponseResult.failure(message: exception.toString());
//     } on ApiException catch (e) {
//       // return ResponseResult.failure(message: e.toString());
//     } on SocketException {
//       // return const ResponseResult.failure(message: networkNotConnected);
//     } on FormatException {
//       // return const ResponseResult.failure(message: responseFormatNotValid);
//     } on Exception catch (e) {
//       // return ResponseResult.failure(message: e.toString());
//     }
//   }

  Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _read(dioProvider).post<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: header),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      _validateResponse(response);
      return response;
    } on DioError catch (dioError) {
      final exception = _handleDioError(dioError);
      logger.warning(exception);
      throw AppException(message: exception.toString());
    } on ApiException catch (e) {
      logger.warning(e);
      throw AppException(code: e.code, message: e.defaultMessage);
    } on SocketException {
      logger.warning(networkNotConnected);
      throw const AppException(message: networkNotConnected);
    } on FormatException {
      logger.warning(responseFormatNotValid);
      throw const AppException(message: responseFormatNotValid);
    } on Exception catch (e) {
      logger.warning(e);
      throw AppException(message: e.toString());
    }
  }

//   Future<ResponseResult> patch(
//     String path, {
//     Map<String, dynamic>? data,
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? header,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final response = await _read(dioProvider).patch<dynamic>(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options ?? Options(headers: header),
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       // final baseResponseData = _parseResponse(response);
//       // return ResponseResult.success(data: baseResponseData);
//     } on DioError catch (dioError) {
//       final exception = _handleDioError(dioError);
//       // return ResponseResult.failure(message: exception.toString());
//     } on ApiException catch (e) {
//       // return ResponseResult.failure(message: e.toString());
//     } on SocketException {
//       // return const ResponseResult.failure(message: networkNotConnected);
//     } on FormatException {
//       // return const ResponseResult.failure(message: responseFormatNotValid);
//     } on Exception catch (e) {
//       // return ResponseResult.failure(message: e.toString());
//     }
//   }

//   Future<ResponseResult> delete(
//     String path, {
//     Map<String, dynamic>? data,
//     Map<String, dynamic>? queryParameters,
//     Map<String, dynamic>? header,
//     Options? options,
//     CancelToken? cancelToken,
//   }) async {
//     try {
//       final response = await _read(dioProvider).delete<dynamic>(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options ?? Options(headers: header),
//         cancelToken: cancelToken,
//       );
//       final baseResponseData = _parseResponse(response);
//       return ResponseResult.success(data: baseResponseData);
//     } on DioError catch (dioError) {
//       final exception = _handleDioError(dioError);
//       return ResponseResult.failure(message: exception.toString());
//     } on ApiException catch (e) {
//       return ResponseResult.failure(message: e.toString());
//     } on SocketException {
//       return const ResponseResult.failure(message: networkNotConnected);
//     } on FormatException {
//       return const ResponseResult.failure(message: responseFormatNotValid);
//     } on Exception catch (e) {
//       return ResponseResult.failure(message: e.toString());
//     }
//   }

  /// レスポンスのステータスコードを検証する。
  void _validateResponse(
    Response<dynamic> response,
  ) {
    final statusCode = response.statusCode;

    if (statusCode == 400) {
      throw const ApiException();
    }
    if (statusCode == 401) {
      throw const UnauthorizedException();
    }
    if (statusCode == 403) {
      throw const ForbiddenException();
    }
    if (statusCode == 404) {
      throw const ApiNotFoundException();
    }
  }

  /// DioError を受けて、何かしらの Exception を return する。
  /// 呼び出し側ではそれをスローする。
  Exception _handleDioError(DioError dioError) {
    final errorType = dioError.type;
    final errorResponse = dioError.response;
    final dynamic error = dioError.error;

    if (errorType.isTimeout) {
      return const ApiTimeoutException();
    }

    if (error is ErrorCode && error == ErrorCode.networkNotConnected) {
      return const NetworkNotConnectedException();
    }

    if (errorResponse == null) {
      return const ApiException();
    }
    return const ApiException();
  }
}

/// HTTP 通信でのエラーの種別の列挙
enum ErrorCode {
  networkNotConnected,
}
