import 'package:flutter_sample_app/models/response_data/base_response_data.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_result.freezed.dart';

@freezed
class ResponseResult with _$ResponseResult {
  /// 成功
  const factory ResponseResult.success({
    required BaseResponseData data,
  }) = Success;

  /// 失敗
  const factory ResponseResult.failure({
    @Default(serverConnectionFailure) String message,
  }) = Failure;
}
