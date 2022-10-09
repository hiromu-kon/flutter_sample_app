import 'package:flutter_sample_app/models/post.dart';
import 'package:flutter_sample_app/models/response_data/base_response_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_posts_response.freezed.dart';
part 'get_posts_response.g.dart';

@freezed
class GetPostsResponse with _$GetPostsResponse {
  factory GetPostsResponse({
    @Default(true) bool success,
    @Default('') String message,
    @Default(Post.defaultListValue) List<Post> posts,
  }) = _GetPostsResponse;

  factory GetPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPostsResponseFromJson(json);

  factory GetPostsResponse.fromBaseResponseData(
    BaseResponseData responseData,
  ) {
    return GetPostsResponse.fromJson(
      <String, dynamic>{
        'success': responseData.success,
        'message': responseData.message,
        'posts': responseData.data['items'],
      },
    );
  }
}
