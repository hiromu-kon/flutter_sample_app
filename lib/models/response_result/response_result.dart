import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_result.freezed.dart';

@freezed
abstract class ResponseResult<T> with _$ResponseResult<T> {
  const factory ResponseResult.success(T value) = Success<T>;
  const factory ResponseResult.failure(Error error) = Failure<T>;
}
