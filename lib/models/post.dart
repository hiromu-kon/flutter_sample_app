import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    required int id,
    required String title,
    required String content,
    required bool isFavorite,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  static const List<Post> defaultListValue = [];
}
