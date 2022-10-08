import 'package:flutter_sample_app/models/post.dart';
import 'package:flutter_sample_app/models/response_data/base_response_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_post_response.freezed.dart';
part 'get_post_response.g.dart';

@freezed
class GetPostResponse with _$GetPostResponse {
  factory GetPostResponse({
    @Default(true) bool success,
    @Default('') String message,
    required Post post,
  }) = _GetPostResponse;

  factory GetPostResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPostResponseFromJson(json);

  factory GetPostResponse.fromBaseResponseData(
    BaseResponseData responseData,
  ) =>
      GetPostResponse.fromJson(
        <String, dynamic>{
          'success': responseData.success,
          'message': responseData.message,
          'post': responseData.data,
        },
      );
}
